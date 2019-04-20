//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import UIKit
import NotificationCenter
import CoreLocation

class TodayViewController: UIViewController {
    // While it is not under our control, in practice the
    // widgetPerformUpdate method is called frequently enough by the OS
    // such that we can design our widget as a "one-shot" flow and
    // do not need to worry about surfacing a refresh button
    // again once a query has been made.
    //
    // When the widgetPerformUpdate method is called:
    // - Return NCUpdateResult.newData.
    // - This causes a viewDidLoad to be called.
    // - If the user has not allowed location access, then show a message
    //   telling the user that location access is needed. On taps, prompt
    //   for access (or take the user to settings if they've previously
    //   denied access access).
    // - Otherwise query the API, showing an activity indicator.
    // - Once the request completes, show the results in a multiline
    //   results label. This label is also used to show if errors occurred,
    //   or if there were no results.
    // - If the user taps at any point now, open the app.

    private var locationAccessNeededLabel: UILabel?
    private var activityIndicatorView: UIActivityIndicatorView?
    private var resultsLabel: UILabel?

    private lazy var digitransitService = DigitransitService()
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            queryAPI()
        } else {
            showLocationAccessNeededLabel()
        }

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func tap() {
        if locationAccessNeededLabel != nil {
            promptForLocationAccess()
        } else if activityIndicatorView != nil {
            // There is a request in progress, do nothing
        } else if resultsLabel != nil {
            // We are displaying the results, open the main app
            // in response to the tap.
            openApp()
        }
    }

    private func showLocationAccessNeededLabel() {
        let label = UILabel(frame: .zero)
        self.locationAccessNeededLabel = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.font = .preferredFont(forTextStyle: .callout)
        label.numberOfLines = 0
        label.text = NSLocalizedString("today_extension_tap_to_allow_location_access", comment: "")

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.readableContentGuide.leadingAnchor, multiplier: 1),
            view.readableContentGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            view.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: label.bottomAnchor, multiplier: 1)
            ])
    }

    private func promptForLocationAccess() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            queryAPI()

        case .notDetermined:
            // If the user provides the permission, then Core Location will let
            // us know by calling the CLLocationManagerDelegate method below.
            locationManager.requestWhenInUseAuthorization()

        case .denied, .restricted:
            openSettings()

        @unknown default:
            break
        }
    }

    private func queryAPI() {
        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        self.activityIndicatorView = activityIndicatorView
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()

        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        // In the first iteration, I tried using the digitransit nearest
        // API to find the bike stations nearest to the user coordinate.
        //
        // Unfortunately, I have observed in practice that the number of
        // bikes returned in the nearest query is sometimes incorrect.
        // Last observed: 14 April 2019
        //
        // As a workaround, I tried to only obtain the names from the nearest
        // query and then do a full query (which always seems to return
        // accurate results) to get the actual number of bikes.
        //
        // However, then I observed that the nearest query sometimes just
        // returns wrong results (i.e. it would return not return
        // locations near me when there were indeed bikes there), so
        // joining with the actual (correct) number of bikes from the full
        // query would not help (since the nearest response would just not
        // contain the correct station names).
        //
        // This is very likely happening because I am not using the API
        // properly. No sarcasm intended, I genuinely am very happy with
        // the API, and it seems surprising that it would not work.
        //
        // Anyways, for now, we always do the full query, and perform
        // the nearest matching locally. This actually should be easier
        // on the API too, because the full response should almost always
        // be a pre-generated/cached JSON that requires no CPU. In practice
        // too, I've observed that the full query response is perceptibly
        // faster than the nearest query.

        digitransitService.getBikeRentalStations { [weak self] response, error in
            DispatchQueue.main.async {
                self?.didGetBikeRentalStations(response: response, error: error)
            }
        }
    }

    private func didGetBikeRentalStations(response: DigitransitService.BikeRentalStationsResponse?, error: Error?) {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil

        if let error = error {
            NSLog("Failed to fetch station information: \(error)")

            let errorMessage = NSLocalizedString("today_extension_request_failed", comment: "")
            showResultsLabel(lines: [errorMessage])

            return
        }

        // Wait until the last possible moment before accessing the user's
        // location.
        //
        // In practice, it was observed that locationManager.location is only
        // valid after the CLLocationManager delegate method below has
        // been called, even if we already have permission.
        //
        // The delegate method is called asynchronously from viewDidLoad,
        // and to avoid all race conditions we should be proceeding further
        // only after the delegate method has been called.
        //
        // But there is a network call in between, that _should_ give us
        // enough buffer for the delegate method to have been called by
        // now. Famous last words, but it seems to work always in practice.

        guard let userLocation = locationManager.location else {
            return
        }

        var distanceAndData = [(distance: Int, bikesAvailable: Int, name: String)]()
        for bikeRentalStation in response?.data?.bikeRentalStations ?? [] {
            guard let bikesAvailable = bikeRentalStation.bikesAvailable,
                bikeRentalStation.realtime == true,
                let name = bikeRentalStation.name,
                let lat = bikeRentalStation.lat,
                let lon = bikeRentalStation.lon else {
                    continue
            }

            let location = CLLocation(latitude: Double(lat), longitude: Double(lon))
            // The returned distance is in meters. Truncate down.
            // Note that this is the "crow flies" distance, not the walking
            // distance, AFAIK there is no API to get that ATM.
            let distance = Int(location.distance(from: userLocation))
            distanceAndData.append((distance: distance, bikesAvailable: bikesAvailable, name: name))
        }

        if distanceAndData.isEmpty {
            let noResultsMessage = NSLocalizedString("today_extension_no_nearby_bikes", comment: "")
            showResultsLabel(lines: [noResultsMessage])

            return
        }

        let sortedDistanceAndData = distanceAndData.sorted(by: { $0.distance < $1.distance })
        let nearestDistanceAndData = sortedDistanceAndData.prefix(3)

        var lines = [String]()
        for (distance, bikesAvailable, name) in nearestDistanceAndData {
            let formatString = NSLocalizedString("today_extension_line", comment: "%lu bikes at %@ (%lu m)")
            let line = String.localizedStringWithFormat(formatString, bikesAvailable, name, distance)
            lines.append(line)
        }

        showResultsLabel(lines: lines)
    }

    private func showResultsLabel(lines: [String]) {
        let label = UILabel(frame: .zero)
        self.resultsLabel = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.font = .preferredFont(forTextStyle: .body)

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.readableContentGuide.leadingAnchor, multiplier: 1),
            view.readableContentGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            view.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: label.bottomAnchor, multiplier: 1)
            ])

        label.numberOfLines = lines.count
        label.text = lines.joined(separator: "\n")

        if lines.count == 1 {
            // This happens either when there was an error, or if
            // we have no results.
            label.textAlignment = .center
        }
    }

    private func openSettings() {
        // The following code does not work:
        /*
         if let url = URL(string: UIApplication.openSettingsURLString) {
         extensionContext?.open(url, completionHandler: nil)
         }
         */
        // The settings app is not opened, and the following is
        // printed on the console:
        /*
         TodayExtension[8400:3179528] -[_NCWidgetExtensionContext openURL:completionHandler:]_block_invoke failed: Error Domain=NSOSStatusErrorDomain Code=-10814 "(null)"
         */

        // As a workaround, trampoline to the main app to open the
        // settings app.

        if let url = URL(string: "bikes://settings") {
            extensionContext?.open(url, completionHandler: nil)
        }
    }

    private func openApp() {
        if let url = URL(string: "bikes://") {
            extensionContext?.open(url, completionHandler: nil)
        }
    }
}

extension TodayViewController: NCWidgetProviding {
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // This is called by the OS "frequently enough". Effectively,
        // everytime the user opens the Today Center afresh.

        // Template Docs:
        // Perform any setup necessary in order to update the view.
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        // Returning .newData here causes viewDidLoad to be called.
        completionHandler(NCUpdateResult.newData)
    }
}

extension TodayViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if locationAccessNeededLabel == nil {
            // The docs state thet the authorization status might change
            // without any action on our part (e.g. due to Airplane mode).
            // https://developer.apple.com/documentation/corelocation/choosing_the_authorization_level_for_location_services/requesting_when-in-use_authorization
            //
            // So only do something in this method if we know it was
            // called because of us calling
            // locationManager?.requestWhenInUseAuthorization() above.

            // I also observed that Core Location automatically calls
            // this method for us after viewDidLoad when location
            // has been granted. Since we're already doing queryAPI
            // from viewDidLoad if we had access, without this check
            // there would be duplicate requests.

            return
        }

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            // If we are authorized, then what has happened is:
            // - The user pressed the locate button
            // - Said yes on the OS prompt
            // - We come here
            // So now do what they want.

            locationAccessNeededLabel?.removeFromSuperview()
            locationAccessNeededLabel = nil

            queryAPI()
        }
    }
}

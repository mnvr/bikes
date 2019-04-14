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
    // do not need to worry about surfacing the refresh button
    // again once a query has been made.
    //
    // When the widgetPerformUpdate method is called:
    // - Return NCUpdateResult.newData
    // - This causes a viewDidLoad to be called
    // - Where we show the refreshLabel (which shows a "refresh" glyph
    //   to the user, indicating that they should tap to refresh).
    // - If the user has not allowed location access, then the refreshLabel
    //   instead shows a message prompting the user to allow access. On
    //   tapping it, we ask for access (or take the user to settings if
    //   they've previously denied access access).
    // - If the user taps at this point, perform an API call. While
    //   that is in progress, show an activity indicator.
    // - Once the request completes, show the results in a multiline
    //   results label.
    // - If the user taps at any point now, open the app.

    private var refreshLabel: UILabel?
    private var activityIndicatorView: UIActivityIndicatorView?
    private var resultsLabel: UILabel?

    private lazy var digitransitService = DigitransitService()
    private lazy var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: .zero)
        self.refreshLabel = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            label.font = .preferredFont(forTextStyle: .title1)
            label.text = "⟳"
        } else {
            label.font = .preferredFont(forTextStyle: .callout)
            label.numberOfLines = 0
            label.text = NSLocalizedString("today_extension_tap_to_allow_location_access", comment: "")
        }

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.readableContentGuide.leadingAnchor, multiplier: 1),
            view.readableContentGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            view.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: label.bottomAnchor, multiplier: 1)
            ])

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func tap() {
        if refreshLabel != nil {
            // We are displaying the refresh label, so do a refresh
            // in response to the tap
            getLocation()
        } else if activityIndicatorView != nil {
            // There is a request in progress, do nothing
        } else if resultsLabel != nil {
            // We are displaying the results, open the main app
            // in response to the tap.
            openApp()
        }
    }

    private func getLocation() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            refresh()

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        case .denied, .restricted:
            openSettings()

        @unknown default:
            break
        }
    }

    private func refresh() {
        guard let userLocationCoordinate = locationManager.location?.coordinate else {
            return
        }

        refreshLabel?.removeFromSuperview()
        refreshLabel = nil

        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        self.activityIndicatorView = activityIndicatorView
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()

        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        let latitude = userLocationCoordinate.latitude
        let longitude = userLocationCoordinate.longitude
        digitransitService.getNearestBikeRentalStations(latitude: latitude, longitude: longitude) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.didGetNearestBikeRentalStations(response: response, error: error)
            }
        }
    }

    private func didGetNearestBikeRentalStations(response: DigitransitService.NearestBikeRentalStationsResponse?, error: Error?) {
        // Unfortunately, I have observed in practice that the number of
        // bikes returned in the nearest query is sometimes incorrect.
        // Last observed: 14 April 2019
        //
        // As a workaround, only obtain the names from the nearest query
        // and then do a full query (which always seems to return
        // accurate results) to get the actual number of bikes.

        guard let response = response else {
            didGetNearestBikeRentalStations(response: nil, bikeRentalStationsResponse: nil, error: error)
            return
        }

        digitransitService.getBikeRentalStations { [weak self] bikeRentalStationsResponse, error in
            self?.didGetNearestBikeRentalStations(response: response, bikeRentalStationsResponse: bikeRentalStationsResponse, error: error)
        }
    }

    private func didGetNearestBikeRentalStations(response: DigitransitService.NearestBikeRentalStationsResponse?, bikeRentalStationsResponse: DigitransitService.BikeRentalStationsResponse?, error: Error?) {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil

        if let error = error {
            NSLog("Failed to fetch station information: \(error)")
            // Continue though.
            //
            // We will show the error message on the results label itself.
        }

        let edges = response?.data?.nearest?.edges ?? []

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

        var lines = [String]()
        for edge in edges {
            if lines.count == 3 {
                break
            }

            if let node = edge.node,
                let bikeRentalStation = node.place,
                let name = bikeRentalStation.name,
                var bikesAvailable = bikeRentalStation.bikesAvailable,
                bikesAvailable > 0,
                let realtime = bikeRentalStation.realtime,
                realtime == true,
                let distance = node.distance {

                // Find a matching entry in the full response.
                //
                // This join can be easily optimized, but the number of
                // stations involved is pretty small that we get can
                // get by for now with these linear scans.
                //
                // See note above in didGetNearestBikeRentalStations
                // for why this is needed.

                if let accurateBikesAvailable = bikeRentalStationsResponse?.data?.bikeRentalStations?.first(where: { $0.name == name })?.bikesAvailable {
                    bikesAvailable = accurateBikesAvailable
                }

                let formatString = NSLocalizedString("today_extension_line", comment: "%lu bikes at %@ (%lu m)")
                let line = String.localizedStringWithFormat(formatString, bikesAvailable, name, distance)
                lines.append(line)
            }
        }

        if lines.count == 0 {
            label.textAlignment = .center
            if error != nil {
                label.text = NSLocalizedString("today_extension_request_failed", comment: "")
            } else {
                label.text = NSLocalizedString("today_extension_no_nearby_bikes", comment: "")
            }

            return
        }

        label.numberOfLines = lines.count
        label.text = lines.joined(separator: "\n")
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
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
}

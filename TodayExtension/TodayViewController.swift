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
    private var lastQueryAPIResult: (response: DigitransitService.BikeRentalStationsResponse?, error: Error?)?
    private var lastUserLocation: CLLocation?

    private var digitransitService = DigitransitService()
    private var stationDataStore = StationDataStore()
    private var userLocationManager: UserLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // When the location manager is ready it will call the
        // didChangeAuthorization method, where we proceed with
        // the rest of the initialization.
        //
        // Until then, show an activity indicator.

        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        self.activityIndicatorView = activityIndicatorView
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()

        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGestureRecognizer)

        userLocationManager = UserLocationManager(delegate: self)
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
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil

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
        guard let userLocationManager = userLocationManager else {
            return
        }

        if !userLocationManager.locateUserIfNotDenied() {
            openSettings()
        }
    }

    private func queryAPIIfNeeded() {
        if lastQueryAPIResult == nil {
            queryAPI()
        }
    }

    private func queryAPI() {
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
        lastQueryAPIResult = (response: response, error: error)
        showResultsIfPossible()
    }

    private func showResultsIfPossible() {
        // If both the API call and the user location access have completed,
        // show results.

        if let queryAPIResult = lastQueryAPIResult, let userLocation = lastUserLocation {
            showResults(response: queryAPIResult.response, error: queryAPIResult.error, userLocation: userLocation)
        }
    }

    // Used in the showResults method below.
    private struct TodayViewResultViewModel: Comparable {
        let name: String
        let bikesAvailable: Int
        let distance: Int
        let isFavourite: Bool

        static func < (lhs: TodayViewResultViewModel, rhs: TodayViewResultViewModel) -> Bool {
            // Sort such that favourites have a higher priority than others.
            // Within equal priority levels, sort by distance.

            if lhs.isFavourite, !rhs.isFavourite {
                return true
            } else if !lhs.isFavourite, rhs.isFavourite {
                return false
            } else {
                return lhs.distance < rhs.distance
            }
        }
    }

    private func showResults(response: DigitransitService.BikeRentalStationsResponse?, error: Error?, userLocation: CLLocation) {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil

        if let error = error {
            NSLog("Failed to fetch station information: \(error)")

            let errorMessage = NSLocalizedString("today_extension_request_failed", comment: "")
            showResultsLabel(lines: [errorMessage])

            return
        }

        let (favouriteStationIDs, blockedStationIDs) = stationDataStore.favouriteAndBlockedStationIDs

        var results = [TodayViewResultViewModel]()
        for bikeRentalStation in response?.data?.bikeRentalStations ?? [] {
            if let stationID = bikeRentalStation.stationId,
                blockedStationIDs?.contains(stationID) == true {
                continue
            }

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

            var isFavourite = false
            if let stationID = bikeRentalStation.stationId,
                favouriteStationIDs?.contains(stationID) == true {
                isFavourite = true
            }

            let result = TodayViewResultViewModel(name: name, bikesAvailable: bikesAvailable, distance: distance, isFavourite: isFavourite)
            results.append(result)
        }

        if results.isEmpty {
            let noResultsMessage = NSLocalizedString("today_extension_no_nearby_bikes", comment: "")
            showResultsLabel(lines: [noResultsMessage])

            return
        }

        let sortedResults = results.sorted()
        let nearestResults = sortedResults.prefix(3)

        var lines = [String]()
        for result in nearestResults {
            let formatString = NSLocalizedString("today_extension_line", comment: "%lu bikes at %@ (%lu m)")
            let line = String.localizedStringWithFormat(formatString, result.bikesAvailable, result.name, result.distance)
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

extension TodayViewController: UserLocationManagerDelegate {
    func userLocationManagerDidChangeAuthorization(_ granted: Bool) {
        if granted {
            locationAccessNeededLabel?.removeFromSuperview()
            locationAccessNeededLabel = nil

            // Fire off an API query while we wait for the user's location.
            queryAPIIfNeeded()
        } else {
            showLocationAccessNeededLabel()
        }
    }

    func userLocationManagerDidObtainUserLocation(_ userLocation: CLLocation) {
        lastUserLocation = userLocation

        showResultsIfPossible()
    }
}

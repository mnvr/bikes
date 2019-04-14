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
                let bikesAvailable = bikeRentalStation.bikesAvailable,
                bikesAvailable > 0,
                let realtime = bikeRentalStation.realtime,
                realtime == true,
                let distance = node.distance {
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
        if let url = URL(string: UIApplication.openSettingsURLString) {
            extensionContext?.open(url, completionHandler: nil)
        }
    }

    private func openApp() {
        guard let url = URL(string: "bikes://") else {
            return
        }
        extensionContext?.open(url, completionHandler: nil)
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

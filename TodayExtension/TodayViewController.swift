//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import UIKit
import NotificationCenter
import CoreLocation

class TodayViewController: UIViewController {
    private var refreshButton: UIButton?
    private var activityIndicatorView: UIActivityIndicatorView?
    private var resultsLabel: UILabel?

    private lazy var digitransitService = DigitransitService()
    private lazy var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        self.refreshButton = button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⟳", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(refresh))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func refresh() {
        if activityIndicatorView != nil {
            // There is a request in progress, ignore more attempts
            return
        }

        // TODO: Are we authorized

        guard let userLocationCoordinate = locationManager.location?.coordinate else {
            return
        }

        NSLog("Refresh")

        refreshButton?.isHidden = true

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
            // Show a red tinted refresh button to indicate an error.
            // TODO
            return
        }

        let edges = response?.data?.nearest?.edges ?? []

        let label = UILabel(frame: .zero)
        self.resultsLabel = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .body)

        view.addSubview(label)
        // TODO: Larger font sizes
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.readableContentGuide.leadingAnchor, multiplier: 1),
            view.readableContentGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
                // TODO: Localise
                // TODO: Plurals
                let line = "\(bikesAvailable) bikes at \(name) (\(distance) m)"
                lines.append(line)
            }
        }

        if lines.count == 0 {
            label.textAlignment = .center
            label.text = NSLocalizedString("today_extension_no_nearby_bikes", comment: "")
            return
        }

        label.numberOfLines = lines.count
        label.text = lines.joined(separator: "\n")
    }
}

extension TodayViewController: NCWidgetProviding {
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        NSLog("Today widget was asked to update")

        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
}

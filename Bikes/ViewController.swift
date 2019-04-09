//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    var digitransitService: DigitransitService?

    private var mapView: MKMapView?
    private var activityIndicatorView: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        self.mapView = mapView

        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: mapView.bottomAnchor)
            ])

        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView = activityIndicatorView

        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        refresh()
    }

    private func refresh() {
        activityIndicatorView?.startAnimating()

        digitransitService?.getBikeRentalStations() { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.didGetBikeRentalStations(response: response, error: error)
            }
        }
    }

    private func didGetBikeRentalStations(response: DigitransitService.BikeRentalStationsResponse?, error: Error?) {
        activityIndicatorView?.stopAnimating()

        if let error = error {
            // TODO Surface this in the UI
            NSLog("Failed to fetch station information: \(error)")
            return
        }

        let bikeRentalStations = response?.data?.bikeRentalStations

        NSLog("\(String(describing: bikeRentalStations))")
    }
}

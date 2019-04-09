//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var digitransitService: DigitransitService?

    private var mapView: MKMapView?
    private var activityIndicatorView: UIActivityIndicatorView?

    let markerAnnotationViewReuseIdentifier = String(describing: MKMarkerAnnotationView.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: markerAnnotationViewReuseIdentifier)
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

        // SVG Icon Source: https://github.com/apancik/public-domain-icons
        // Saved to "location.svg".
        //
        // SVG converted to PDF using: https://cloudconvert.com/svg-to-pdf
        //
        // Thank you 💯

        let locationIconImage = UIImage(imageLiteralResourceName: "Location").withRenderingMode(.alwaysTemplate)

        let locateMeButton = UIButton(type: .system)
        locateMeButton.translatesAutoresizingMaskIntoConstraints = false
        locateMeButton.setImage(locationIconImage, for: .normal)
        locateMeButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        locateMeButton.addTarget(self, action: #selector(locateMe), for: .touchUpInside)

        view.addSubview(locateMeButton)
        NSLayoutConstraint.activate([
            locateMeButton.widthAnchor.constraint(equalToConstant: 44),
            locateMeButton.heightAnchor.constraint(equalTo: locateMeButton.widthAnchor),
            locateMeButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            locateMeButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])

        // TODO: Hide for now
        locateMeButton.isHidden = true

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

        // MapKit terminology:
        // - An annotation is a point.
        // - An overlay is a region.

        // Convert each of the stations into an annotation

        var annotations = [MKAnnotation]()

        for bikeRentalStation in bikeRentalStations ?? [] {
            guard let lat = bikeRentalStation.lat,
                let lon = bikeRentalStation.lon else {
                    continue
            }

            // The current API documentation states that non realtime
            // entries will always report a fixed number of bikes. So
            // if the station is not realtime, display a "?" to the
            // user instead of potentially misleading information (the
            // user might walk there and feel angry that what was
            // promised was not delivered).

            let title: String?
            let markerTintColor: UIColor?
            if let bikesAvailable = bikeRentalStation.bikesAvailable,
                let realtime = bikeRentalStation.realtime,
                realtime == true {
                title = "\(bikesAvailable)"

                // The color scheme can be improved. I'm not using a
                // verbatim sequential scheme from colorbrewer because
                // the foreground color of the text is white, which is
                // not legible on the sequential schemes.

                if bikesAvailable == 0 {
                    markerTintColor = .gray
                } else if bikesAvailable <= 1 {
                    markerTintColor = .red
                } else if bikesAvailable <= 3 {
                    markerTintColor = .orange
                } else {
                    // RGB: 44,162,95
                    // Source: http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3
                    markerTintColor = UIColor(red: 44.0 / 255, green: 162.0 / 255, blue: 95.0 / 255, alpha: 1.0)
                }
            } else {
                title = "?"
                markerTintColor = .black
            }

            let subtitle = bikeRentalStation.name

            let latitude = CLLocationDegrees(lat)
            let longitude = CLLocationDegrees(lon)
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            let annotation = BikeStationAnnotation()
            annotation.coordinate = coordinate
            annotation.title = title
            annotation.subtitle = subtitle

            annotation.markerTintColor = markerTintColor

            annotations.append(annotation)
        }

        mapView?.showAnnotations(annotations, animated: true)

        NSLog("\(String(describing: bikeRentalStations))")
    }

    @objc private func locateMe() {

    }
}

extension MapViewController: MKMapViewDelegate {
    private class BikeStationAnnotation: MKPointAnnotation {
        var markerTintColor: UIColor?
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: markerAnnotationViewReuseIdentifier, for: annotation)
        guard let markerAnnotationView = view as? MKMarkerAnnotationView else {
            return view
        }

        markerAnnotationView.glyphText = annotation.title ?? "?"

        if let bikeStationAnnotation = annotation as? BikeStationAnnotation {
            markerAnnotationView.markerTintColor = bikeStationAnnotation.markerTintColor
        }

        return markerAnnotationView
    }
}

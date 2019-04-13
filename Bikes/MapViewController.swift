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
    private var locationManager: CLLocationManager?
    private var didRequestLocation = false

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

        let locationManager = CLLocationManager()
        self.locationManager = locationManager
        locationManager.delegate = self

        // SVG Icon Source: https://github.com/apancik/public-domain-icons
        // Saved to "location.svg".
        //
        // SVG converted to PDF using: https://cloudconvert.com/svg-to-pdf
        //
        let locationIconImage = UIImage(imageLiteralResourceName: "Location").withRenderingMode(.alwaysTemplate)

        let locateMeButton = UIButton(type: .system)
        locateMeButton.translatesAutoresizingMaskIntoConstraints = false
        locateMeButton.setImage(locationIconImage, for: .normal)
        locateMeButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        locateMeButton.addTarget(self, action: #selector(maybeLocateMe), for: .touchUpInside)

        view.addSubview(locateMeButton)
        NSLayoutConstraint.activate([
            locateMeButton.widthAnchor.constraint(equalToConstant: 44),
            locateMeButton.heightAnchor.constraint(equalTo: locateMeButton.widthAnchor),
            locateMeButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            locateMeButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])

        mapView.showsUserLocation = true

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locateMeWhenAuthorized()
        }

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

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            // We might be already showing the map centered on the user's
            // location. So do not change the current viewport of the
            // map, instead just drop the annotations into whatever the
            // map is currently showing.

            mapView?.addAnnotations(annotations)
        } else {
            // If we do not have location access, use the showAnnotations
            // methods that zooms the map such that it fits the
            // given annotations.
            //
            // By default, when we don't have access, then the map
            // shows the entirety of Finland. So this effectively
            // zooms into the Helsinki region.

            mapView?.showAnnotations(annotations, animated: true)
        }

        NSLog("\(String(describing: bikeRentalStations))")
    }

    @objc private func maybeLocateMe() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            locateMeWhenAuthorized()

        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()

        case .denied, .restricted:
            locateMeWhenNotAuthorized()

        @unknown default:
            break
        }
    }

    private func locateMeWhenNotAuthorized() {
        // Show an alert to the user telling them that they need to
        // give access to the app in settings for us to be able to
        // locate them.
        //
        // On the alert show a button to open settings.

        let title = NSLocalizedString("no_location_alert_title", comment: "")
        let message = NSLocalizedString("no_location_alert_message", comment: "")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let openSettingsTitle = NSLocalizedString("no_location_alert_open_settings", comment: "")
        alertController.addAction(UIAlertAction(title: openSettingsTitle, style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }))

        let cancelTitle = NSLocalizedString("cancel", comment: "")
        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))

        present(alertController, animated: true)
    }

    private func locateMeWhenAuthorized() {
        // Redundant check, but do it anyways.
        let authorizationStatus = CLLocationManager.authorizationStatus()
        guard authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways else {
            return
        }

        guard CLLocationManager.locationServicesEnabled() else {
            // I don't know (yet) when we will reach here
            // (and that doesn't mean we won't; in any case,
            // this is what the Apple sample code tells us to do).
            return
        }

        guard let userLocationCoordinate = locationManager?.location?.coordinate else {
            return
        }

        let viewRegion = MKCoordinateRegion(center: userLocationCoordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView?.region = viewRegion
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

        guard let bikeStationAnnotation = annotation as? BikeStationAnnotation else {
            // We will also get called when MapKit needs a marker to show
            // the user's location. Return nil for that (and any other
            // "unknown" annotation type cases) so that the default
            // annotation is used.
            return nil
        }

        markerAnnotationView.glyphText = annotation.title ?? "?"
        markerAnnotationView.markerTintColor = bikeStationAnnotation.markerTintColor

        return markerAnnotationView
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if !didRequestLocation {
            // The docs state thet the authorization status might change
            // without any action on our part (e.g. due to Airplane mode).
            // https://developer.apple.com/documentation/corelocation/choosing_the_authorization_level_for_location_services/requesting_when-in-use_authorization
            //
            // So only do something in this method if we know it was
            // called because of us calling
            // locationManager?.requestWhenInUseAuthorization() above.
            return
        }

        didRequestLocation = false

        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            // If we are authorized, then what has happened is:
            // - The user pressed the locate button
            // - Said yes on the OS prompt
            // - We come here
            // So now do what they want.
            locateMeWhenAuthorized()
        default:
            break
        }
    }

}

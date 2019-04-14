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
    private var toolbar: UIToolbar?
    private var locationManager: CLLocationManager?
    private var didRequestLocation = false
    private var isAPIRequestInProgress = false
    private var lastSuccessfulAPIRequestCompletionDate: Date?

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

        let toolbar = UIToolbar(frame: .zero)
        self.toolbar = toolbar
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolbar)
        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: toolbar.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: toolbar.bottomAnchor)
            ])

        let locationManager = CLLocationManager()
        self.locationManager = locationManager
        locationManager.delegate = self

        mapView.showsUserLocation = true

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locateMeWhenAuthorized()
        }

        NotificationCenter.default.addObserver(self, selector: #selector(refreshIfNeeded), name: UIApplication.willEnterForegroundNotification, object: nil)

        refresh()
    }

    @objc private func refresh() {
        isAPIRequestInProgress = true
        lastSuccessfulAPIRequestCompletionDate = nil

        updateToolbar()

        digitransitService?.getBikeRentalStations() { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.didGetBikeRentalStations(response: response, error: error)
            }
        }
    }

    private func didGetBikeRentalStations(response: DigitransitService.BikeRentalStationsResponse?, error: Error?) {
        isAPIRequestInProgress = false

        // The toolbar is currently showing an activity indicator
        // to indicate a request in progress.

        if let error = error {
            NSLog("Failed to fetch station information: \(error)")
            // The toolbar will now show a red tinted refresh button to
            // indicate an error.
            updateToolbar()
            return
        }

        lastSuccessfulAPIRequestCompletionDate = Date()
        // The toolbar will now show a regular refresh button.
        updateToolbar()

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
                //
                // Current set of colors picked from with the
                // help of http://tools.medialab.sciences-po.fr/iwanthue/
                // RGB:
                // [[225,22,0],
                //  [241,155,62],
                //  [16,137,8]]

                if bikesAvailable == 0 {
                    markerTintColor = .gray
                } else if bikesAvailable <= 1 {
                    // Red
                    markerTintColor = UIColor(red: 225 / 255.0, green: 22 / 255.0, blue: 0 / 255.0, alpha: 1)
                } else if bikesAvailable <= 3 {
                    // Orange
                    markerTintColor = UIColor(red: 241 / 255.0, green: 155 / 255.0, blue: 62 / 255.0, alpha: 1)
                } else {
                    // Green
                    markerTintColor = UIColor(red: 16 / 255.0, green: 137 / 255.0, blue: 8 / 255.0, alpha: 1)
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

    @objc private func refreshIfNeeded() {
        if isRefreshNeeded {
            refresh()
        }
    }

    private let oneMinute: TimeInterval = 60

    private var isRefreshNeeded: Bool {
        // Where "needed" is if the last API request was made more than a
        // minute ago.

        if !isAPIRequestInProgress,
            let timeIntervalSinceLastAPIRequest = lastSuccessfulAPIRequestCompletionDate?.timeIntervalSinceNow,
            -timeIntervalSinceLastAPIRequest > oneMinute {
            return true
        }

        return false
    }

    private func makeLocationToolbarIconImage() -> UIImage {
        // SVG Icon Source: https://github.com/apancik/public-domain-icons
        // Saved to "location.svg".
        //
        // SVG converted to PDF using: https://cloudconvert.com/svg-to-pdf

        let locationIconImage = UIImage(imageLiteralResourceName: "Location").withRenderingMode(.alwaysTemplate)

        // The Apple Human Interface Guidelines (as of Apr 2019) state
        // that the size of a toolbar icon should be between
        // 24 and 28 points.
        // https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/custom-icons/

        let size = CGSize(width: 24, height: 24)
        let imageRenderer = UIGraphicsImageRenderer(size: size)
        return imageRenderer.image(actions: { (context) in
            locationIconImage.draw(in: CGRect(origin: .zero, size: size))
        })
    }

    func updateToolbar() {
        let leftMostBarButtonItem: UIBarButtonItem?
        if isAPIRequestInProgress {
            let activityIndicatorView = UIActivityIndicatorView(style: .gray)
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.startAnimating()

            leftMostBarButtonItem = UIBarButtonItem(customView: activityIndicatorView)
        } else if lastSuccessfulAPIRequestCompletionDate == nil {
            // The last API request failed, show a red tinted refresh
            // button to indicate an error
            leftMostBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
            leftMostBarButtonItem?.tintColor = .red
        } else {
            // Everything done, and a-ok. Show a regular refresh button
            // after one minute
            if isRefreshNeeded {
                leftMostBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
            } else {
                let oneMinutePlusChange = oneMinute + 5
                DispatchQueue.main.asyncAfter(deadline: .now() + oneMinutePlusChange) { [weak self] in
                    self?.updateToolbar()
                }

                leftMostBarButtonItem = nil
            }
        }

        let infoButton = UIButton(type: .infoLight)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(showInfo), for: .touchUpInside)

        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)

        let locateMeBarButtonItem = UIBarButtonItem(image: makeLocationToolbarIconImage(), style: .plain, target: self, action: #selector(maybeLocateMe))

        var items = [UIBarButtonItem]()
        if let leftMostBarButtonItem = leftMostBarButtonItem {
            items.append(leftMostBarButtonItem)
        }
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(infoBarButtonItem)
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 15
        items.append(fixedSpace)
        items.append(locateMeBarButtonItem)

        toolbar?.setItems(items, animated: false)
    }

    @objc private func showInfo() {
        let title = NSLocalizedString("info_action_sheet_title", comment: "")
        let message = NSLocalizedString("info_action_sheet_message", comment: "")

        let websiteTitle = NSLocalizedString("info_action_sheet_city_bike_website", comment: "")
        let requestAFeatureTitle = NSLocalizedString("Request a Feature", comment: "")
        let okayTitle = NSLocalizedString("info_action_sheet_okay", comment: "")

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: websiteTitle, style: .default, handler: { [weak self] _ in
            self?.openCityBikeWebsite()
        }))

        alertController.addAction(UIAlertAction(title: requestAFeatureTitle, style: .default, handler: { [weak self] _ in
            self?.requestAFeature()
        }))

        alertController.addAction(UIAlertAction(title: okayTitle, style: .cancel, handler: nil))

        present(alertController, animated: true)
    }

    private func openCityBikeWebsite() {
        // The website title is also the URL of the website, and it is
        // different for each localization.
        let websiteURLString = NSLocalizedString("info_action_sheet_city_bike_website", comment: "")
        if let url = URL(string: websiteURLString) {
            UIApplication.shared.open(url)
        }
    }

    private func requestAFeature() {
        // The website title is also the URL of the website, and it is
        // different for each localization.
        if let url = URL(string: "https://github.com/mnvr/bikes/issues") {
            UIApplication.shared.open(url)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    private class BikeStationAnnotation: MKPointAnnotation {
        var markerTintColor: UIColor?
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let bikeStationAnnotation = annotation as? BikeStationAnnotation else {
            // We will also get called when MapKit needs a marker to show
            // the user's location. Return nil for that (and any other
            // "unknown" annotation type cases) so that the default
            // annotation is used.
            //
            // It is important to do this before calling
            // dequeueReusableAnnotationView below, otherwise MapKit
            // crashes when trying to show the user location marker.
            return nil
        }

        let view = mapView.dequeueReusableAnnotationView(withIdentifier: markerAnnotationViewReuseIdentifier, for: annotation)
        guard let markerAnnotationView = view as? MKMarkerAnnotationView else {
            return view
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

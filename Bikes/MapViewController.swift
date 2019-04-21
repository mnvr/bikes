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
    private var isAPIRequestInProgress = false
    private var lastSuccessfulAPIRequestCompletionDate: Date?
    private var lastPlacedAnnotations = [MKAnnotation]()
    private let drawerViewInitialContentHeight: CGFloat = 44
    // This is computed at runtime from to account for the safe area.
    private var drawerViewInitialHeight: CGFloat = 0
    private var drawerView: UIView?
    private var drawerViewEnableLocationAccessButton: UIButton?
    private var drawerViewTopAnchorConstraint: NSLayoutConstraint?
    private var drawerViewPanStartingHeight: CGFloat = 0

    let markerAnnotationViewReuseIdentifier = String(describing: MKMarkerAnnotationView.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: markerAnnotationViewReuseIdentifier)
        mapView.showsUserLocation = true
        self.mapView = mapView

        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: mapView.bottomAnchor)
            ])

        createDrawerView()

        let locationManager = CLLocationManager()
        self.locationManager = locationManager
        locationManager.delegate = self

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
        // The toolbar will now show a regular refresh button (after a minute).
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

        // Remove last placed annotations.
        //
        // We need to keep track of the annotations that we placed
        // so that we only remove those (and don't remove, e.g.
        // the user location annotation placed by MapKit for us).

        mapView?.removeAnnotations(lastPlacedAnnotations)
        lastPlacedAnnotations = annotations

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
            // shows the entirety of Finland.
            //
            // The annotations in the response are littered around Helsinki
            // and Espoo, so the below effectively zooms into the Helsinki
            // region.

            mapView?.showAnnotations(annotations, animated: true)
        }
    }

    @objc private func locateMe() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            requestLocation()

        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()

        case .denied, .restricted:
            showNoLocationAlert()

        @unknown default:
            break
        }
    }

    private func showNoLocationAlert() {
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

    private func zoomToUserLocation(_ userLocation: CLLocation) {
        let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
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

        let locateMeBarButtonItem = UIBarButtonItem(image: makeLocationToolbarIconImage(), style: .plain, target: self, action: #selector(locateMe))

        var items = [UIBarButtonItem]()
        if let leftMostBarButtonItem = leftMostBarButtonItem {
            items.append(leftMostBarButtonItem)
        }
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        items.append(locateMeBarButtonItem)

        toolbar?.setItems(items, animated: false)
    }

    private func createDrawerView() {
        let drawerView = UIView(frame: .zero)
        drawerView.translatesAutoresizingMaskIntoConstraints = false

        drawerView.layer.shadowColor = UIColor.lightGray.cgColor
        drawerView.layer.shadowOpacity = 0.3

        if !UIAccessibility.isReduceTransparencyEnabled {
            let blurEffect = UIBlurEffect(style: .regular)
            let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
            blurVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
            drawerView.addSubview(blurVisualEffectView)
            NSLayoutConstraint.activate([
                blurVisualEffectView.topAnchor.constraint(equalTo: drawerView.topAnchor),
                blurVisualEffectView.leadingAnchor.constraint(equalTo: drawerView.leadingAnchor),
                drawerView.trailingAnchor.constraint(equalTo: blurVisualEffectView.trailingAnchor),
                drawerView.bottomAnchor.constraint(equalTo: blurVisualEffectView.bottomAnchor)
                ])
        } else {
            drawerView.backgroundColor = .white
        }

        let toolbar = UIToolbar(frame: .zero)
        self.toolbar = toolbar
        toolbar.translatesAutoresizingMaskIntoConstraints = false

        // We add our own blur to the drawer but UIToolbar does its own
        // blur by default too, which is slightly different from the
        // various blurs we get by using UIBlurEffect.
        //
        // Disable the UIToolbar blurring by setting its background to
        // a transparent 1x1 image.

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
        let image = renderer.image { (context) in
            UIColor.clear.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        }
        toolbar.setBackgroundImage(image, forToolbarPosition: .any, barMetrics: .default)

        drawerView.addSubview(toolbar)
        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: drawerView.leadingAnchor),
            drawerView.trailingAnchor.constraint(equalTo: toolbar.trailingAnchor),
            toolbar.topAnchor.constraint(equalTo: drawerView.topAnchor)
         ])

        let handleView = UIView(frame: .zero)
        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.backgroundColor = .lightGray
        drawerView.addSubview(handleView)
        NSLayoutConstraint.activate([
            handleView.topAnchor.constraint(equalTo: drawerView.topAnchor, constant: 10),
            handleView.widthAnchor.constraint(equalTo: drawerView.widthAnchor, multiplier: 0.15),
            handleView.centerXAnchor.constraint(equalTo: drawerView.centerXAnchor),
            handleView.heightAnchor.constraint(equalToConstant: 5)
            ])

        handleView.layer.cornerRadius = 2.5

        let descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.text = NSLocalizedString("info_description", comment: "")

        let enableLocationAccessButton = UIButton(type: .system)
        self.drawerViewEnableLocationAccessButton = enableLocationAccessButton
        enableLocationAccessButton.translatesAutoresizingMaskIntoConstraints = false
        enableLocationAccessButton.setTitle(NSLocalizedString("info_enable_location_access", comment: ""), for: .normal)
        enableLocationAccessButton.titleLabel?.adjustsFontSizeToFitWidth = true
        enableLocationAccessButton.addTarget(self, action: #selector(locateMe), for: .touchUpInside)

        let cityBikeWebsiteButton = UIButton(type: .system)
        cityBikeWebsiteButton.translatesAutoresizingMaskIntoConstraints = false
        cityBikeWebsiteButton.setTitle(NSLocalizedString("info_helsinki_city_bike_website", comment: ""), for: .normal)
        cityBikeWebsiteButton.titleLabel?.adjustsFontSizeToFitWidth = true
        cityBikeWebsiteButton.addTarget(self, action: #selector(openCityBikeWebsite), for: .touchUpInside)

        let appWebsiteButton = UIButton(type: .system)
        appWebsiteButton.translatesAutoresizingMaskIntoConstraints = false
        appWebsiteButton.setTitle(NSLocalizedString("info_app_website", comment: ""), for: .normal)
        appWebsiteButton.titleLabel?.adjustsFontSizeToFitWidth = true
        appWebsiteButton.addTarget(self, action: #selector(openAppWebsite), for: .touchUpInside)

        let widgetTipLabel = UILabel(frame: .zero)
        widgetTipLabel.translatesAutoresizingMaskIntoConstraints = false
        widgetTipLabel.adjustsFontForContentSizeCategory = true
        widgetTipLabel.numberOfLines = 0
        widgetTipLabel.font = .preferredFont(forTextStyle: .callout)
        widgetTipLabel.text = NSLocalizedString("info_widget_tip", comment: "")

        let widgetExampleImage = UIImage(imageLiteralResourceName: "WidgetExample")
        let widgetExampleImageView = UIImageView(image: widgetExampleImage)
        widgetExampleImageView.translatesAutoresizingMaskIntoConstraints = false
        widgetExampleImageView.contentMode = .scaleAspectFit
        widgetExampleImageView.alpha = 0.8

        let footerLabel = UILabel(frame: .zero)
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.adjustsFontForContentSizeCategory = true
        footerLabel.font = .preferredFont(forTextStyle: .footnote)
        footerLabel.adjustsFontSizeToFitWidth = true
        footerLabel.text = NSLocalizedString("info_footer", comment: "")
        footerLabel.textColor = .darkText

        let stackView = UIStackView(arrangedSubviews: [
            descriptionLabel,
            enableLocationAccessButton,
            cityBikeWebsiteButton,
            appWebsiteButton,
            widgetTipLabel,
            widgetExampleImageView,
            footerLabel
            ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center

        stackView.spacing = 4
        stackView.setCustomSpacing(8, after: descriptionLabel)
        stackView.setCustomSpacing(32, after: appWebsiteButton)
        stackView.setCustomSpacing(8, after: widgetTipLabel)
        stackView.setCustomSpacing(32, after: widgetExampleImageView)

        drawerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            descriptionLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            widgetTipLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            widgetExampleImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            stackView.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 48),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: drawerView.leadingAnchor, multiplier: 1),
            drawerView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),

            // Without an explicit constraint the image view has extraneous height
            widgetExampleImageView.widthAnchor.constraint(equalTo: widgetExampleImageView.heightAnchor, multiplier: 2.5),
            ])

        self.drawerView = drawerView

        view.addSubview(drawerView)
        NSLayoutConstraint.activate([
            drawerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: drawerView.trailingAnchor),
            // To ensure that the content in the drawer is not squashed
            // when it is collapsed, create a fixed height constraint
            // for the drawer, and instead animate its topAnchor using
            // the drawerViewTopAnchorConstraint.
            drawerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9),
            ])

        // Tell UIKit about the initial height of the attachment view so
        // that the map view moves the "Legal" label at the bottom above
        // the initial height of the attachment view.
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: drawerViewInitialContentHeight, right: 0)

        drawerViewInitialHeight = drawerViewInitialContentHeight
        drawerViewTopAnchorConstraint = view.bottomAnchor.constraint(equalTo: drawerView.topAnchor, constant: drawerViewInitialHeight)
        drawerViewTopAnchorConstraint?.isActive = true

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panDrawerView))
        drawerView.addGestureRecognizer(panGestureRecognizer)
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()

        // Increase the height of the attachment view to account for the
        // safe area, if any. We cannot pin to the safe area layout guide
        // because we want the attachment view to extend into the safe
        // area, though it should not have any content in the safe area.
        //
        // The safe area insets are zero in viewDidLoad. They become
        // valid in viewSafeAreaInsetsDidChange.
        //
        // Note that this method might be called multiple times. If
        // it is called after the user has swiped up to reveal the
        // attachment view, then the attachment view would collapse
        // again, but currently I can't think of a scenario where
        // that would happen, so no safeguards against that.

        let bottomSafeAreaInset = view.safeAreaInsets.bottom
        // This should be something like
        // drawerViewInitialHeight = drawerViewInitialContentHeight + bottomSafeAreaInset
        // but we've already added drawerViewInitialContentHeight to
        // the additional safe area insets in view did load, so now
        // the bottom safe inset already includes that.
        drawerViewInitialHeight = bottomSafeAreaInset

        drawerViewTopAnchorConstraint?.constant = drawerViewInitialHeight
    }

    @objc private func panDrawerView(_ panGestureRecognizer: UIPanGestureRecognizer) {
        func animateHeightChange(_ newHeight: CGFloat) {
            // Convert pan gesture recognizer velocity (expressed in points
            // per second) to the animation velocity (expressed as the
            // animation distance travelled per second).
            let gestureDistancePerSecond = panGestureRecognizer.velocity(in: view).y
            let currentHeight = drawerViewTopAnchorConstraint?.constant ?? drawerViewInitialHeight
            let distanceToTravel = newHeight - currentHeight
            let animationDistancePerSecond = gestureDistancePerSecond / distanceToTravel
            let initialSpringVelocity = abs(animationDistancePerSecond)

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: initialSpringVelocity, options: [], animations: { [weak self] in
                self?.drawerViewTopAnchorConstraint?.constant = newHeight
                self?.view.layoutIfNeeded()
                }, completion: nil)
        }

        if panGestureRecognizer.state == .began {
            // Save starting height when the gesture begins.
            drawerViewPanStartingHeight = drawerViewTopAnchorConstraint?.constant ?? drawerViewInitialHeight

            return
        }

        if panGestureRecognizer.state == .cancelled {
            // If the gesture is cancelled, animate back to the starting position.
            animateHeightChange(drawerViewPanStartingHeight)

            return
        }

        let minimumHeight = drawerViewInitialHeight
        var maximumHeight = minimumHeight
        if let drawerHeight = drawerView?.frame.size.height {
            // Keep some margin to account for the spring bounce.
            maximumHeight = drawerHeight * 0.9
        }

        if panGestureRecognizer.state == .ended {
            let threshold: CGFloat = 75
            let currentHeight = drawerViewTopAnchorConstraint?.constant ?? drawerViewInitialHeight
            let newHeight: CGFloat
            if currentHeight > drawerViewPanStartingHeight + threshold {
                // User has swiped up more than some threshold. Expand.
                newHeight = maximumHeight
            } else if currentHeight < drawerViewPanStartingHeight - threshold {
                // User has swiped down more than some threshold. Collapse
                newHeight = minimumHeight
            } else {
                // Cancel the swipe.
                newHeight = drawerViewPanStartingHeight
            }

            animateHeightChange(newHeight)

            return
        }

        guard panGestureRecognizer.state == .changed else {
            return
        }

        let translation = panGestureRecognizer.translation(in: view)
        var newHeight = drawerViewPanStartingHeight - translation.y
        if newHeight < minimumHeight {
            newHeight = minimumHeight
        } else if newHeight > maximumHeight {
            newHeight = maximumHeight
        }

        drawerViewTopAnchorConstraint?.constant = newHeight
    }

    @objc private func openCityBikeWebsite() {
        let websiteURLString = NSLocalizedString("info_helsinki_city_bike_website_url", comment: "")
        if let url = URL(string: websiteURLString) {
            UIApplication.shared.open(url)
        }
    }

    @objc private func openAppWebsite() {
        if let url = URL(string: "https://github.com/mnvr/bikes") {
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

        let detailsButton = UIButton(type: .detailDisclosure)
        detailsButton.translatesAutoresizingMaskIntoConstraints = false

        markerAnnotationView.canShowCallout = true
        markerAnnotationView.rightCalloutAccessoryView = detailsButton

        return markerAnnotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let coordinate = view.annotation?.coordinate else {
            return
        }

        // Map Links Documentation: https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html
        //
        // The format of the one we need:
        // http://maps.apple.com/maps?saddr=Current+Location&daddr=<Your Location>
        //
        // The docs (when I looked) did not mention it, but "Current Location"
        // seems to be the countersign.
        // TODO: Test this with Finnish locale.

        let locationString = "\(coordinate.latitude),\(coordinate.longitude)"
        let urlString = "http://maps.apple.com/maps?saddr=Current+Location&daddr=\(locationString)"
        guard let url = URL(string: urlString) else {
            return
        }

        UIApplication.shared.open(url)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // This method is called in multiple scenarios:
        //
        // - Sometime after initializing the location manager during
        //   viewDidLoad. Note that this happens asynchronously, so
        //   we cannot rely on the order of viewDidLoad/coming-here.
        //
        // - When the authorization status changes as a result of us
        //   calling requestWhenInUseAuthorization.
        //
        // - The docs mention that it might be called in other scenarios
        //   to, without any action on our part (e.g. due to Airplane mode).

        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            drawerViewEnableLocationAccessButton?.isHidden = true
            requestLocation()
        } else {
            drawerViewEnableLocationAccessButton?.isHidden = false
        }
    }

    private func requestLocation() {
        guard CLLocationManager.locationServicesEnabled() else {
            // I don't know (yet) when we will reach here.
            // Doing this because this is what the Apple sample code does.
            return
        }

        // Request location once to ensure that
        // locationManager?.location?.coordinate becomes non-nil.
        //
        // CLLocationManager calls the didUpdateLocations delegate
        // method when it is done.
        //
        // Note that on the simulator, it sometimes takes a while
        // (4-5 seconds) before the delegate method is called.

        locationManager?.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let mostRecentLocation = locations.last else {
            NSLog("WARNING: Could not obtain user location")
            return
        }

        zoomToUserLocation(mostRecentLocation)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("locationManager:didFailWithError: \(error)")
    }
}

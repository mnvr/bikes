//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import Foundation
import CoreLocation

/// Simple wrapper over CLLocationManager to help deal with some
/// of the gotchas.

class UserLocationManager: NSObject {
    private let locationManager: CLLocationManager
    private weak var delegate: UserLocationManagerDelegate?

    // Take the delegate as an init parameter because we want
    // it to be around in case CLLocationManager synchronously
    // calls its delegate methods when we create it
    // and set its delegate.
    init(delegate: UserLocationManagerDelegate) {
        self.delegate = delegate

        locationManager = CLLocationManager()

        super.init()

        locationManager.delegate = self
    }

    // - If we have location access, then refresh the user's location
    //   and call the userLocationManagerDidObtainUserLocation delegate method.
    // - If we do not have location access, then request it.
    // - If we had been previously denied permission, return false.

    func locateUserIfNotDenied() -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            requestLocation()
            return true

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return true

        case .denied, .restricted:
            return false

        @unknown default:
            // Your guess is as good as mine.
            return true
        }
    }
}

protocol UserLocationManagerDelegate: class {
    func userLocationManagerDidChangeAuthorization(_ granted: Bool)
    func userLocationManagerDidObtainUserLocation(_ userLocation: CLLocation)
}

extension UserLocationManager: CLLocationManagerDelegate {
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
            delegate?.userLocationManagerDidChangeAuthorization(true)
            requestLocation()
        } else {
            delegate?.userLocationManagerDidChangeAuthorization(false)
        }
    }

    private func requestLocation() {
        guard CLLocationManager.locationServicesEnabled() else {
            // I don't know (yet) when we will reach here.
            // Doing this because this is what the Apple sample code does.

            return
        }

        // Disregard any cached location present in locationManager.location
        // and query afresh.

        // locationManager.requestLocation() does exactly what we
        // want, but in practice it is much slower that
        // startUpdatingLocation, and then calling stopUpdatingLocation
        // once we get a result.

        // CLLocationManager calls the didUpdateLocations delegate
        // method when it is done.
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()

        guard let mostRecentLocation = locations.last else {
            NSLog("WARNING: Could not obtain user location")
            return
        }

        delegate?.userLocationManagerDidObtainUserLocation(mostRecentLocation)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("locationManager:didFailWithError: \(error)")
    }
}

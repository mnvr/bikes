//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var digitransitService: DigitransitService?
    private var stationDataStore: StationDataStore?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        digitransitService = DigitransitService()
        stationDataStore = StationDataStore()

        let mapViewController = MapViewController()
        mapViewController.digitransitService = digitransitService
        mapViewController.stationDataStore = stationDataStore

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = mapViewController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.host == "settings" {
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL)
            }
        }
        return true
    }
}

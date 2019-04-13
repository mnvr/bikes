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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        digitransitService = DigitransitService()

        let mapViewController = MapViewController()
        mapViewController.digitransitService = digitransitService

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = mapViewController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}

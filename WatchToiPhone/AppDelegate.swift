import UIKit
import SwiftUI
import SwiftData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let contentView = UIHostingController(rootView: ContentView())
        window.rootViewController = contentView
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
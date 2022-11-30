//
//  AppDelegate.swift
//  Weather
//
//  Created by Helga on 30.11.22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let initialBuilder = ViewController() // SendTransactionsBuilder()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()

        window?.rootViewController = initialBuilder //.build()

        return true
    }
}

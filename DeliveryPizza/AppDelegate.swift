//
//  AppDelegate.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/13/24.
//

import UIKit
import netfox

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController()
        NFX.sharedInstance().start()
        window = UIWindow()
        startWithMain(navigationController: navController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }

    private func startWithMain(navigationController: UINavigationController) {
        let presenter = MainViewPresenter()
        let mainViewController = MainViewController(output: presenter)
        presenter.view = mainViewController
        navigationController.viewControllers = [mainViewController]
    }
}


//
//  AppDelegate.swift
//  PlanetsAnimation
//
//  Created by Евгения Шарамет on 17.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = MainNavigationController()
        window.makeKeyAndVisible()
        self.window = window
        self.window?.backgroundColor = .systemGray4
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("updateAnimation"), object: nil)
    }
    
}


//
//  AppDelegate.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController = UINavigationController()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.window = UIWindow()
        self.navController = UINavigationController(rootViewController: AuthorizationScreenViewController())
        self.window?.rootViewController = navController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

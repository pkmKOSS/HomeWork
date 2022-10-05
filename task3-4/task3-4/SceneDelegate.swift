//
//  SceneDelegate.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

// Сгенерированый SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let mainViewController = MainScreenViewController()
        let navController = UINavigationController(rootViewController: mainViewController)
        self.window?.rootViewController = navController
        self.window?.backgroundColor = UIColor.white
    }
}

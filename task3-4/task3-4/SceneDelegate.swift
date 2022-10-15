//
//  SceneDelegate.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Сгенерированый SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let tabBarController = MainTabBarController()
        self.window?.rootViewController = tabBarController
        self.window?.backgroundColor = .white
    }
}

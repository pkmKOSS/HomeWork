//
//  MainTabBarController.swift
//  ShopProjectHomeWork
//
//  Created by Григоренко Александр Игоревич on 16.10.2022.
//

import UIKit
/// Главный ТабБарКонтроллер.
final class MainTabBarController: UITabBarController {

    // MARK: - private properties

    private var anchorVC = UINavigationController()
    private var nsConstraintsVC = UINavigationController()
    private var viewsInStackVC = UINavigationController()
    private var storyboardVC = UIViewController()

    // MARK: - Init

    init() {
        super.init(nibName: nil, bundle: nil)
        configureNavControllers()
        configureTabBarController()
        configureTabBarItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private methods

    private func configureNavControllers() {
        anchorVC = UINavigationController(rootViewController: AnchorViewContrller())
        nsConstraintsVC = UINavigationController(rootViewController: NSLayoutConstraintsViewController())
        viewsInStackVC = UINavigationController(rootViewController: ViewsInStackViewController())
        storyboardVC = UINavigationController(rootViewController: StoryBoardViewController())
    }

    private func configureTabBarController() {
        storyboardVC = UIStoryboard(
            name: Strings.storyboardVCName,
            bundle: nil
        ).instantiateViewController(withIdentifier: Strings.storyboardIdentifier)
        self.viewControllers = [
            nsConstraintsVC,
            viewsInStackVC,
            anchorVC,
            storyboardVC
        ]
        tabBar.backgroundColor = #colorLiteral(red: 0.07058823854, green: 0.07058823854, blue: 0.07058823854, alpha: 1)
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().barTintColor = .systemBlue
    }

    private func configureTabBarItems() {
        anchorVC.tabBarItem = UITabBarItem(title: Strings.item1Title, image: nil, tag: 0)
        nsConstraintsVC.tabBarItem = UITabBarItem(title: Strings.item2Title, image: nil, tag: 1)
        viewsInStackVC.tabBarItem = UITabBarItem(title: Strings.item3Title, image: nil, tag: 2)
        storyboardVC.tabBarItem = UITabBarItem(title: Strings.item4Title, image: nil, tag: 3)
    }
}

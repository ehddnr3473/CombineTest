//
//  TabBarController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/16.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    private func setUp() {
        let playViewController = PlayViewController()
        let playNavigationController = UINavigationController(rootViewController: playViewController)

        let accountViewController = AccountViewController()
        let accountNavigationContoller = UINavigationController(rootViewController: accountViewController)
        
        let combineWithNotification = CombineWithNotification()
        
        playNavigationController.tabBarItem = UITabBarItem(title: NameConstants.playTitle, image: UIImage(systemName: NameConstants.playIconName), tag: NumberConstants.first)
        accountNavigationContoller.tabBarItem = UITabBarItem(title: NameConstants.viewTitle, image: UIImage(systemName: NameConstants.viewIconName), tag: NumberConstants.second)
        combineWithNotification.tabBarItem = UITabBarItem(title: NameConstants.notificationTitle, image: UIImage(systemName: NameConstants.notificationIconName), tag: NumberConstants.third)
        
        viewControllers = [playNavigationController, accountNavigationContoller, combineWithNotification]
        setViewControllers(viewControllers, animated: true)

        tabBar.tintColor = .systemRed
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .white
    }
}

private struct NameConstants {
    static let playTitle = "Playground"
    static let viewTitle = "View"
    static let notificationTitle = "Notification"
    static let playIconName = "gamecontroller"
    static let viewIconName = "list.bullet.clipboard"
    static let notificationIconName = "alarm"
    
    
}
private struct NumberConstants {
    static let first = 0
    static let second = 1
    static let third = 2
}

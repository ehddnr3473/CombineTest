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
        
        let myTestViewController = MyAccountViewController()
        
        playNavigationController.tabBarItem = UITabBarItem(title: NameConstants.playTitle, image: UIImage(systemName: NameConstants.playIconName), tag: NumberConstants.first)
        accountNavigationContoller.tabBarItem = UITabBarItem(title: NameConstants.viewTitle, image: UIImage(systemName: NameConstants.viewIconName), tag: NumberConstants.second)
        combineWithNotification.tabBarItem = UITabBarItem(title: NameConstants.notificationTitle, image: UIImage(systemName: NameConstants.notificationIconName), tag: NumberConstants.third)
        myTestViewController.tabBarItem = UITabBarItem(title: NameConstants.test, image: UIImage(systemName: NameConstants.testIconName), tag: NumberConstants.fourth)
        
        viewControllers = [playNavigationController, accountNavigationContoller, combineWithNotification, myTestViewController]
        setViewControllers(viewControllers, animated: true)

        tabBar.tintColor = .systemRed
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .white
    }
}

private enum NameConstants {
    static let playTitle = "Playground"
    static let viewTitle = "View"
    static let notificationTitle = "Notification"
    static let test = "Test"
    static let playIconName = "gamecontroller"
    static let viewIconName = "list.bullet.clipboard"
    static let notificationIconName = "alarm"
    static let testIconName = "testtube.2"
    
    
}
private enum NumberConstants {
    static let first = 0
    static let second = 1
    static let third = 2
    static let fourth = 3
}

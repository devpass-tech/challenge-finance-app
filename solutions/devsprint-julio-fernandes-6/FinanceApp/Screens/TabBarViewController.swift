//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Joao Gripp on 30/08/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        self.setupTabBarViewController()
    }
    
    private func setupTabBarViewController() {
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeViewController.tabBarItem = homeTabBar
        
        let transferViewController = UINavigationController(rootViewController: TransfersViewController())
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transferViewController.tabBarItem = transfersTabBar
        
        self.viewControllers = [homeViewController, transferViewController]
    }

}

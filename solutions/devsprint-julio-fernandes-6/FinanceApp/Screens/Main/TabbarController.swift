//
//  MainViewController.swift
//  FinanceApp
//
//  Created by Filipe Marques on 30/08/22.
//

import UIKit


class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
    }
        
    
    private func setupViews() {

        let homeViewController = HomeViewController()
        
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 1)
        
        homeViewController.tabBarItem = homeTabBar
        
        
        let transferViewController = TransfersViewController()
        
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        
        transferViewController.tabBarItem = transfersTabBar
        
        viewControllers = [
            UINavigationController(rootViewController: homeViewController),
            UINavigationController(rootViewController: transferViewController)
        ]
    }
}


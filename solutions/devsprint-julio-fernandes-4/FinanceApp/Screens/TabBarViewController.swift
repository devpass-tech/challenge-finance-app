//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by MacBook on 22/06/22.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTab()
        self.setupUI()
    }
    
    func setupTab(){
        self.tabBar.tintColor = .systemBlue
        self.view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setupUI() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let transfersVC = UINavigationController(rootViewController: TransfersViewController())
        
        homeVC.title = "Home"
        transfersVC.title = "Transfers"
        
        homeVC.tabBarItem.image = UIImage(systemName: "house.fill")
        transfersVC.tabBarItem.image = UIImage(systemName: "arrow.up.arrow.down")
        
        self.setViewControllers([homeVC, transfersVC], animated: true)
    }
}

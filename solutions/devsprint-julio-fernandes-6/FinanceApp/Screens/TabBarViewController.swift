//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Joao Gripp on 30/08/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabBarViewController()
    }
    
    private func setupTabBarViewController() {
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        
        let transferViewController = UINavigationController(rootViewController: TransfersViewController())
        
        self.setViewControllers([homeViewController, transferViewController], animated: true)
//        self.tabBar.backgroundColor = .white
//        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house.fill")
        
        items[1].title = "Transfer"
        items[1].image = UIImage(systemName: "arrow.up.arrow.down")
    }

}

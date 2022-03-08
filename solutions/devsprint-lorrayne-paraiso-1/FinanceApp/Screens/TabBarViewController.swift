//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Vinicius Rocha on 08/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: TransfersViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "arrow.up.arrow.down")
        
        vc1.title = "Home"
        vc2.title = "Transfers"
        
        tabBar.tintColor = .systemBlue
        
        setViewControllers([vc1,vc2], animated: true)
    }
    

}

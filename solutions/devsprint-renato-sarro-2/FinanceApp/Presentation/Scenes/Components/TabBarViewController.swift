//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Patricia Cardozo on 24/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupControllers()
    }
    
    func setupTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setupControllers() {
        
        viewControllers = [
            creatingNavigationController(with: HomeViewController(),
                                       title: "Home",
                                       image: UIImage(named: "house.fill")
                                      ),
            creatingNavigationController(with: TransfersViewController(),
                                       title: "Transfers",
                                       image: UIImage(named: "arrow.up.arrow.down")
                                      )
        ]
    }
    
    private func creatingNavigationController(with rootViewController: UIViewController,
                                            title: String,
                                            image: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        
        return navigationController
        
    }
}

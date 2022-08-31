//
//  MainViewController.swift
//  FinanceApp
//
//  Created by Filipe Marques on 30/08/22.
//

import UIKit


class MainViewController: UITabBarController {
    
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
        let homeVC = HomeViewController()
        let transferVC = TransfersViewController()
        
        homeVC.setTabBarImage(imageName: "house", title: "Home")
        transferVC.setTabBarImage(imageName: "arrow.up.arrow.down", title: "Transfers")
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let transferNC = UINavigationController(rootViewController: transferVC)
        
        let tabBarList = [homeNC, transferNC]
        
        viewControllers = tabBarList
    }
}


extension UIViewController {
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

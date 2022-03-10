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
        self.setupUI()
    }
}

//MARK: Private extension - used to store private methods
private extension UITabBarController{
    func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.tabBar.tintColor = .systemBlue
        
        let homeVc = UINavigationController(rootViewController: HomeViewController())
        let transfersVc = UINavigationController(rootViewController: TransfersViewController())
        
        homeVc.tabBarItem.image = UIImage(systemName: "house.fill")
        transfersVc.tabBarItem.image = UIImage(systemName: "arrow.up.arrow.down")
        
        homeVc.title = "Home"
        transfersVc.title = "Transfers"
        
        setViewControllers([homeVc,transfersVc], animated: true)
    }
}

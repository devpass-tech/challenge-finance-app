//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    var service: FinanceServiceInterface = FinanceService()
    
    private let homeView: ActivityListView = {
        let homeView = ActivityListView()
        return homeView
    }()
    
    override func viewDidLoad() {
        navigationItem.title = "Finance App"
        navigationController?.navigationBar.prefersLargeTitles = true
        service.fetchHomeData { activities in
            DispatchQueue.main.async {
                self.homeView.updateView(with: activities)
            }
        }
    }

    override func loadView() {
        self.view = homeView
    }
}

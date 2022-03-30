//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service = FinanceService()

    private let activityListView: ActivityListView = {

        let activityListView = ActivityListView()
        
        return activityListView
    }()
    
    
    
    
//    lazy var savingsLabel:

    override func viewDidLoad() {

        navigationItem.title = "Finance App"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        service.fetchHomeData { activities in

            DispatchQueue.main.async {

                self.activityListView.updateView(with: activities)
            }
        }
    }

    override func loadView() {
        self.view = activityListView
    }
}

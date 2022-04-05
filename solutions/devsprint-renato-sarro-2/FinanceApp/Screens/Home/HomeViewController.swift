//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service = FinanceService()

    private let activityView: ActivityViewProtocol = {
        let activityView = ActivityView()
        return activityView
    }()

    override func viewDidLoad() {
        
        service.fetchHomeData { [activityView] data in
            let summary = ActivitySummaryInfo(balance: "\(data.balance)",
                                              savings: "\(data.savings)",
                                              spending: "\(data.spending)")
            
            activityView.updateInfo(with: data.activity.map { $0 },
                                    summaryInfo: summary)
            
            let activity = ActivityView()
            
        }
    }

    override func loadView() {
        self.view = activityView as? UIView
    }
}

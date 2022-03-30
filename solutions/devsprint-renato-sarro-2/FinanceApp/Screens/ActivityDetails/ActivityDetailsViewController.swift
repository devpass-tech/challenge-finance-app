//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsViewController: UIViewController {
    
    private let service = FinanceService()
    private var activityDetailsModel: ActivityDetailsModel?
    
    private let activityDetailsView: ActivityDetailsView = {

        let activityDetailsView = ActivityDetailsView()
        return activityDetailsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.fetchActivityDetails { activity in
            
            DispatchQueue.main.async {
                let category = activity.category
                let price = String(activity.price)
                let name = activity.name
                let time = activity.time
                
                self.activityDetailsView.categoryLabel.text = category
                self.activityDetailsView.priceLabel.text = "$\(price)"
                self.activityDetailsView.nameLabel.text = name
                self.activityDetailsView.timeLabel.text = time
            }
        }
    }

    override func loadView() {
        self.view = activityDetailsView
    }
    
    
}

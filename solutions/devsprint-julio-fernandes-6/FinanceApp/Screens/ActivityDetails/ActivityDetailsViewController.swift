//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    
    // deixamos como "var" e sem ser private para que possamos nos testes injetar um Mock
    var activity: Activity? {
        willSet {
            guard let data = newValue else { return }
            activityDetailsView.setupView(activity: data)
        }
    }

    private lazy var activityDetailsView: ActivityDetailsView = {
        let view = ActivityDetailsView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        self.view = activityDetailsView
    }
    
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    func didPressReportIssueButton() {
        let successAlert = UIAlertController(
            title: "Success!",
            message: "Issue Reported",
            preferredStyle: .alert
        )
        successAlert.addAction(UIAlertAction(title: "OK", style: .default))
        showDetailViewController(successAlert, sender: self)
    }
}

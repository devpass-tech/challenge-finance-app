//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    let container = ActivityDetailsView()
    
        override func loadView() {
            self.view = container
        }
}


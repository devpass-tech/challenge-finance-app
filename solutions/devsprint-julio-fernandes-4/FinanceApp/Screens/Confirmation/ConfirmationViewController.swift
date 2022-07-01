//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {

    private lazy var confirmationView: ConfirmationView = {
        let confirmationView = ConfirmationView(selector: #selector(hanleNewTap), target: self)
        
        return confirmationView
    }()
    
    override func loadView() {
        self.view = confirmationView
    }
    
    @objc func hanleNewTap() {
        dismiss(animated: true, completion: nil)
    }
}

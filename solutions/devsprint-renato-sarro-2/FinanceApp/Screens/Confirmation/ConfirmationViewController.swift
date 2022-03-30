//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ConfirmationViewProtocol: AnyObject {
    func didFinish()
}

class ConfirmationViewController: UIViewController, ConfirmationViewProtocol {
    override func loadView() {
        view = ConfirmationView()
        
    }
    
    func didFinish() {
        dismiss(animated: true)
    }
}

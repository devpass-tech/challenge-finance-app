//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ConfirmationViewController: UIViewController {

    private lazy var confirmationView: ConfirmationView = {
        let view = ConfirmationView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        self.view = confirmationView
    }
    
}

// MARK: ConfirmationViewDelegate
extension ConfirmationViewController: ConfirmationViewDelegate {
    func didPressNiceButton() {
        dismiss(animated: true)
    }
}

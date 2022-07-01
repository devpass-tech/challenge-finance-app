//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit


final class TransfersViewController: UIViewController {
    
    private lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        
        return transferView
    }()
    
    override func loadView() {
        self.view = transferView
    }
    
}

// MARK: - Action Button
extension TransfersViewController: TransfersViewDelegate {
    func ChooseContact() {
        let contactListViewController = ContactListViewController()
        let rootContactListViewController = UINavigationController(rootViewController: contactListViewController)
        
        present(rootContactListViewController, animated: true)
    }
    
    func transfersConfimation() {
        let confimationViewController = ConfirmationViewController()
        
        present(confimationViewController, animated: true)
    }
}


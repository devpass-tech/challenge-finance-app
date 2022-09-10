//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {

    private lazy var transfersView: TransfersView = {
        let view = TransfersView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        self.view = transfersView
    }
    
}

extension TransfersViewController: TransferViewDelegate {
    
    func didPressChooseContactButton() {
        let controller = ContactListViewController()
        showDetailViewController(controller, sender: self)
    }
    
    func didPressTransferButton() {
        let controller = ConfirmationViewController()
        showDetailViewController(controller, sender: self)
    }
    
    
}

//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    let container = ContactListView()
    
    override func loadView() {
        container.delegate = self
        self.view = container
    }
}

// MARK: Delegate tableview protocol
extension ContactListViewController: ContactListDelegateProtocol {
    func selectContact() {
        //TODO: Implement some action func
        self.dismiss(animated: true)
    }
}

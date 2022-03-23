//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    
    private let service = FinanceService()

    override func loadView() {
        self.view = ContactListView()
    }
    
    override func viewDidLoad() {
        navigationItem.title = "Contact List"
        
        service.fetchContactList()
    }
}

//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    
    lazy var mainView: ContactListViewProtocol = {
       return ContactListView()
    }()
    
    private let service: ContactServiceProtocol
    
    init(service: ContactServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView as? UIView
    }
    
    override func viewDidLoad() {
        navigationItem.title = "Contact List"
        
        service.getContacts { [mainView] contactList in
            mainView.updateList(with: contactList)
        } failure: { error in
            print(error)
        }
    }
}

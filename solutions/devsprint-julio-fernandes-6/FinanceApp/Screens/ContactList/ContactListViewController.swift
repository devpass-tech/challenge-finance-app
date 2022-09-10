//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {

    // deixamos como "var" e sem ser private para que possamos nos testes injetar um Mock
    var service: FinanceServiceProtocol = FinanceService()
    
    private lazy var contactListView: ContactListView = {
        let view = ContactListView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func loadView() {
        self.view = contactListView
    }
    
    private func fetchData() {
        service.load(endpoint: .contactList, callbackQueue: .main) { [weak self] (response: Result<[ContactModel], FinanceServiceError>) in
            switch response {
            case let .success(dto): self?.contactListView.render(.buildContactList(dto))
            case .failure: break
            }
        }
    }
    
}

// MARK: ContactListViewDelegate
extension ContactListViewController: ContactListViewDelegate {
    func didPressContact() {
        dismiss(animated: true)
    }
}

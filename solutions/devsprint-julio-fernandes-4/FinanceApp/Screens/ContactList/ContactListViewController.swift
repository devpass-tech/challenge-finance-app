//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {
    private let service = FinanceService()
    
    //MARK: Vars
    
    private(set) var contactList: [ContactListModel] = []
    
    private lazy var container: ContactListView = {
        return ContactListView(tableViewDataSource: self,
                               tableViewDelegate: self)
    }()
    
    //MARK: Inits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact List"
        fetchContactListData()
    }
    
    override func loadView() {
        self.view = container
    }
}

//MARK: Request API

private extension ContactListViewController {
    func fetchContactListData() {
        service.load(endpoint: .contactList) {[weak self] (response: Result<[ContactListModel], FinanceServiceError>) in
            guard let self = self else { return }
            switch response {
            case let .success(list):
                self.contactList = list
                self.loadContactListData()
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func loadContactListData() {
        DispatchQueue.main.async {
            self.container.loadContactListTableView()
        }
    }
}

// MARK: TableViewDataSource

extension ContactListViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return contactList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.identifier, for: indexPath) as? ContactCellView else {return UITableViewCell()
        }
        let contactList = contactList[indexPath.row]
        cell.setupCell(contactList: contactList)
        return cell
    }
}

// MARK: TableViewDelegate

extension ContactListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
    }
}


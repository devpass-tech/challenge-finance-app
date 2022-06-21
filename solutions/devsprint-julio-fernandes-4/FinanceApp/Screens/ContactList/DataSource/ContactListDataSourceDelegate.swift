//
//  ContactListDataSourceDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 20/06/22.
//

import UIKit

protocol ContactListDelegateProtocol: AnyObject {
    func dismiss()
}

class ContactListDataSourceDelegate: NSObject {
    
    // MARK: Var
    var tableView: UITableView
    weak var delegate: ContactListDelegateProtocol?
    
    // MARK: Init
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ContactListDataSourceDelegate: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 8
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.identifier, for: indexPath) as? ContactCellView else {return UITableViewCell()
        }

        return cell
    }
}

extension ContactListDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.dismiss()
    }
    
}



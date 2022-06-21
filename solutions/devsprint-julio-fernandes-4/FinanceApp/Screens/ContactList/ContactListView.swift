//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListView: UIView, ConfigurableView {
    
    static let cellSize = CGFloat(80)
    
    // MARK: Var
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.identifier)
        return tableView
    }()
    
    lazy var dataSource: ContactListDataSourceDelegate = {
        ContactListDataSourceDelegate(tableView: self.tableView)
    }()
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        initLayout()
        dataSource.delegate = self
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configuration
extension ContactListView {
    func initSubviews() {
        addSubview(tableView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: Delegate tableview protocol
extension ContactListView: ContactListDelegateProtocol {
    func dismiss() {
        //TODO: Implement some action func
        print("working")
    }
}



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
    
    // MARK: Init
    init(tableViewDataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate) {
        super.init(frame: .zero)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        self.backgroundColor = .white
        loadContactListTableView()
        initLayout()
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    func loadContactListTableView() {
        self.tableView.reloadData()
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




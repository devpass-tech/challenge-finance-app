//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ContactListViewProtocol {
    func updateList(with list: [Contact])
}

class ContactListView: UIView, ContactListViewProtocol {
    
    // Fake Data
    private var contacts: [Contact]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.identifier)
        return tableView
    }()
    
    init() {
        contacts = []
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateList(with list: [Contact]) {
        contacts = list
        tableView.reloadData()
    }
    
}

//MARK: - View Configuration

extension ContactListView: ViewConfiguration {
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        // TableView Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

//MARK: - TableView Datasource

extension ContactListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.identifier, for: indexPath) as! ContactCellView
        
        cell.contact = contact
        
        return cell
    }
}

//MARK: - TableView Delegate

extension ContactListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

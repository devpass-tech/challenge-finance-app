//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ContactListDelegateProtocol: AnyObject {
    func selectContact()
}

final class ContactListView: UIView, ConfigurableView {
    
    static let cellSize = CGFloat(80)
    weak var delegate: ContactListDelegateProtocol?
    
    // MARK: Var
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        initLayout()
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        return nil
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

// MARK: TableViewDatasource

extension ContactListView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 8
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.identifier, for: indexPath) as? ContactCellView else {return UITableViewCell()
        }

        return cell
    }
}

// MARK: TableViewDelegate

extension ContactListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectContact()
    }
}



//
//  UserProfileView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileView: UIView {

    private lazy var headerView: UserProfileHeaderView = {
        let headerView = UserProfileHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 232)
        return headerView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        return tableView
    }()
    
    private lazy var sectionAndRowsOne: [UITableViewCell] = []
    
    private lazy var sectionAndRowsTwo: [UITableViewCell] = [
        setupCell(style: .default, title: "Need help?"),
        setupCell(style: .default, title: "About DevPass"),
        setupCell(title: "App Version", detail: "1.0.0"),
    ]

    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

// MARK: Private methods
private extension UserProfileView {

    func setupCell(style: UITableViewCell.CellStyle = .value1, title: String, detail: String? = nil) -> UITableViewCell {
        let cell = UITableViewCell(style: style, reuseIdentifier: "Cell")
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = detail
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: ViewCodeProtocol
extension UserProfileView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        tableView.reloadData()
    }
}

// MARK: UITableViewDataSource
extension UserProfileView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? sectionAndRowsOne.count : sectionAndRowsTwo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return indexPath.section == 0 ? sectionAndRowsOne[indexPath.row] : sectionAndRowsTwo[indexPath.row]
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "My account" : "General"
    }

}

// MARK: Setup view
extension UserProfileView {
    
    enum RenderType {
        case buildPersonalData(_ dto: UserProfileModel)
    }

    func render(_ type: UserProfileView.RenderType) {
        switch type {
        case let .buildPersonalData(dto):
            headerView.setupView(name: dto.name, agency: dto.account.agency, account: dto.account.account, bank: "Devpass bank")
            sectionAndRowsOne = [
                setupCell(title: "Phone", detail: dto.phone),
                setupCell(title: "E-mail", detail: dto.email),
                setupCell(title: "Address", detail: dto.address),
            ]
            tableView.reloadData()
        }
    }
}

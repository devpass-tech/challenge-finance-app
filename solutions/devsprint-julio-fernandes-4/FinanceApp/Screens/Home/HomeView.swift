//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct HomeViewConfiguration {

    let activities: [String]
}

final class HomeView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var activities: [String] = []
    
    private lazy var accountSummaryView: AccountSummaryView = {
        let view = AccountSummaryView.init(
            viewModel: .init(balance: "$15,459.27", savings: "$1000", spending: "$500")
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()

    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with activities: [String]) {

        self.activities = activities
        self.tableView.reloadData()
    }
}

private extension HomeView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        self.addSubview(self.accountSummaryView)
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            self.accountSummaryView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.accountSummaryView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.accountSummaryView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.accountSummaryView.heightAnchor.constraint(equalToConstant: 200),

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.accountSummaryView.bottomAnchor, constant: 20),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.activities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = self.activities[indexPath.row]
        return cell
    }
}


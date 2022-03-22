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

final class HomeView: UIView{
    
    private let listViewCellIdentifier = "ListViewCellIdentifier"

    lazy var headerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var amountLabel: UILabel = {
        let label =  UILabel()
        label.text = "$15,459.27"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var savingsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var savingsView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Savings"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var amountSavingsLabel: UILabel = {
        let label = UILabel()
        label.text = "$1000"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var spendingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var spendingView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x:0, y: 0, width: 24, height: 24)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Spending"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var amountSpedingLabel: UILabel = {
        let label = UILabel()
        label.text = "$500"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var activityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var activities: [String] = []

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

        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
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


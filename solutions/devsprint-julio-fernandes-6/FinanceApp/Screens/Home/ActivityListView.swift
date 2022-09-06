//
//  ActivityListView.swift
//  FinanceApp
//
//  Created by Joao Gripp on 01/09/22.
//

import UIKit

//struct HomeViewConfiguration {
//
//    let activities: [String]
//}

final class ActivityListView: UIView {

    private var activities: [UITableViewCell] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: ActivityCellView.cellIdentifier)
        tableView.register(ActivityInfoCellView.self, forCellReuseIdentifier: ActivityInfoCellView.cellIdentifier)
        tableView.dataSource = self
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with activities: [String]) {
        self.activities.append(ActivityInfoCellView(style: .default, reuseIdentifier: ActivityInfoCellView.cellIdentifier))
        self.activities.append(contentsOf: activities.map { title in return ActivityCellView(title: title) })
        self.tableView.reloadData()
    }
}

extension ActivityListView: ViewCodeProtocol {
    func buildViewHierarchy() {
        self.backgroundColor = .white
        self.addSubview(self.tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}

extension ActivityListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return activities[indexPath.row]
    }
}

//
//  TableView.swift
//  FinanceApp
//
//  Created by Isabella Gama Lucero Freitas on 24/03/22.
//
import UIKit
import Foundation

final class ActivityListView: UITableView, ViewConfiguration {
    func configViews() {
        <#code#>
    }
    
    func buildViews() {
        <#code#>
    }
    
    func setupConstraints() {
        <#code#>
    }
    
    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
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


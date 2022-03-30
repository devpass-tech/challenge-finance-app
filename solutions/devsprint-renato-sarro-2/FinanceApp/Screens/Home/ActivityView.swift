//
//  TableView.swift
//  FinanceApp
//
//  Created by Isabella Gama Lucero Freitas on 24/03/22.
//
import UIKit
import Foundation

protocol ActivityViewProtocol {
    func updateInfo(with activities: [String], summaryInfo: ActivitySummaryInfo)
}

final class ActivityView: UIView, ViewConfiguration, ActivityViewProtocol {
    private let listViewCellIdentifier = "ListViewCellIdentifier"
    
    lazy var summaryView: ActivitySummaryView = {
        let view = ActivitySummaryView()
        return view
    }()
    
    private var activities: [String] = []
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateInfo(with activities: [String], summaryInfo: ActivitySummaryInfo) {
        self.activities = activities
        tableView.reloadData()
        
        summaryView.updateInfo(with: summaryInfo)
    }
    
    func configViews() {
        
    }
    
    func buildViews() {
        [summaryView, tableView].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            summaryView.topAnchor.constraint(equalTo: topAnchor),
            summaryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: summaryView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ActivityView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.activities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = self.activities[indexPath.row]
        return cell
    }
}


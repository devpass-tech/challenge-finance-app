//
//  ActivityListView.swift
//  FinanceApp
//
//  Created by Vinicius Rocha on 16/03/22.
//

import UIKit

class ActivityListView: UIView {

    lazy var activities: [Activity] = []
    
    static let cellSize = CGFloat(90)

    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var activityLabel: UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Activity"
        return label;
    }()
    
    

    init() {
        super.init(frame: .zero)
        
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {

        self.tableView.reloadData()
    }
}

extension ActivityListView {
    
    func setupViews() {

        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        
        self.addSubview(self.activityLabel)
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            self.activityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.activityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.activityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 16),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
}

extension ActivityListView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activity = activities[indexPath.row]
        
        // Change for ActivityCellView
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ActivityCellIdentifier")

        // Format Price
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        cell.textLabel?.text = activity.name
        cell.detailTextLabel?.text =  "\(currencyFormatter.string(from: NSNumber(value: activity.price))!) • \(activity.time)"
        
        return cell
    }
}

extension ActivityListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ActivityListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

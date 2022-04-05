//
//  TableView.swift
//  FinanceApp
//
//  Created by Isabella Gama Lucero Freitas on 24/03/22.
//
import UIKit
import Foundation

struct ActivityViewInfo{
    let name: String
    let price: Int
    let time: Date
    
}

protocol ActivityViewProtocol {
    func updateInfo(with activities: [Activity], summaryInfo: ActivitySummaryInfo)
}

final class ActivityView: UIView, ViewConfiguration, ActivityViewProtocol {
    private let listViewCellIdentifier = "ListViewCellIdentifier"
    
    lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.font = .systemFont(ofSize: 20)
        label.text = "Activity"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var summaryView: ActivitySummaryView = {
        let view = ActivitySummaryView()
        return view
        
    }()
    
    private var activities: [Activity] = []
    
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
    
    func updateInfo(with activities: [Activity], summaryInfo: ActivitySummaryInfo) {
        self.activities = activities
        tableView.reloadData()
        
        summaryView.updateInfo(with: summaryInfo)
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [summaryView, tableView].forEach(addSubview)
        addSubview(activityLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            summaryView.topAnchor.constraint(equalTo: topAnchor),
            summaryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityLabel.topAnchor.constraint(equalTo: summaryView.bottomAnchor),
            activityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ActivityView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.activities.count
    } // método obrigatório do protocolo para informar a quantidade de linhas da tabela
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let activity = activities[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = activity.name
        
        switch activity.name {
        case "Mall":
            cell.imageView?.image = UIImage(named: "bag.circle.fill")
        case "Food Court":
            cell.imageView?.image = UIImage(named: "fork.knife.circle.fill")
        case "Oceanic Airlines":
            cell.imageView?.image = UIImage(named: "airplane.circle.fill")
        case "Gym Membership":
            cell.imageView?.image = UIImage(named: "heart.circle.fill")
        case "Private Transport":
            cell.imageView?.image = UIImage(named: "car.circle.fill")
        default:
            break
        }
      

        return cell
    } // método  também obrigatório do protocolo, que será chamado toda vez que uma linha precisar ser exibida
}


//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct HomeViewConfiguration {

    let homeData: HomeModel
}

final class HomeView: UIView {
    
    let activityListView: ActivityListView = {
        let activityListView = ActivityListView()
        activityListView.translatesAutoresizingMaskIntoConstraints = false
        return activityListView
    }()

    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with configuration: HomeViewConfiguration) {
        self.activityListView.activities = configuration.homeData.activity
        self.activityListView.tableView.reloadData()
    }
}

private extension HomeView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        
        self.addSubview(self.activityListView)
    }

    func configureSubviewsConstraints() {
        
        let estimatedHeight = CGFloat(activityListView.tableView.numberOfRows(inSection: 0))*ActivityListView.cellSize

        NSLayoutConstraint.activate([
            self.activityListView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.activityListView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.activityListView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.activityListView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.activityListView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            self.activityListView.heightAnchor.constraint(equalToConstant: estimatedHeight)
        ])
    }
}


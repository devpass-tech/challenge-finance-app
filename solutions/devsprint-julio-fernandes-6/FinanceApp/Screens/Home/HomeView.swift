//
//  HomeView.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/09/22.
//

import UIKit

final class HomeView: UIView {
    
    private weak var delegate: ActivityListViewDelegate?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(listView)
        return stackView
    }()
    
    private lazy var headerView: HomeHeaderView = {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var listView: ActivityListView = {
        let view = ActivityListView()
        view.delegate = delegate
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(delegate: ActivityListViewDelegate?) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

// MARK: ViewCodeProtocol
extension HomeView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

// MARK: Setup view
extension HomeView {
    
    enum RenderType {
        case buildHeader(_ dto: HomeModel)
        case buildActivityList(_ list: [Activity])
    }

    func render(_ type: HomeView.RenderType) {
        switch type {
        case let .buildHeader(dto): headerView.setupView(balance: dto.balance, savings: dto.savings, spending: dto.spending)
        case let .buildActivityList(dto): listView.activities = dto
        }
    }
}

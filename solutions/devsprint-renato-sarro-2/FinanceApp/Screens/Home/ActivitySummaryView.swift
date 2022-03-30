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

final class HomeView: UIView, ViewConfiguration{
    
    private let listViewCellIdentifier = "ListViewCellIdentifier"

    lazy var headerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        return stackView
    }()
    
    lazy var amountLabel: UILabel = {
        let label =  UILabel()
        label.text = "$15,459.27"
//        label.frame = CGRect(x: 0, y: 0, width: 374, height: 41)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var savingsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
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
        stackView.spacing = 10
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
        label.text = "Activity"
        label.frame = CGRect(x: 0, y: 0, width: 65, height: 24)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var activities: [String] = []


    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with activities: [String]) {

        self.activities = activities
    }
    
    func configViews() {
        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func buildViews() {
        addSubview(headerStack)
        addSubview(activityLabel)
        headerStack.addArrangedSubview(amountLabel)
        headerStack.addArrangedSubview(savingsStack)
        headerStack.addArrangedSubview(spendingStack)
        savingsStack.addArrangedSubview(savingsView)
        savingsStack.addArrangedSubview(savingsLabel)
        savingsStack.addArrangedSubview(amountSavingsLabel)
        spendingStack.addArrangedSubview(spendingView)
        spendingStack.addArrangedSubview(spendingLabel)
        spendingStack.addArrangedSubview(amountSpedingLabel)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            amountSavingsLabel.trailingAnchor.constraint(equalTo: savingsLabel.trailingAnchor, constant: 146),
            amountSpedingLabel.trailingAnchor.constraint(equalTo: spendingLabel.trailingAnchor, constant: 146),
            activityLabel.topAnchor.constraint(equalTo:headerStack.bottomAnchor, constant: 34),
            activityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 369),
            activityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:20),
            
            savingsView.widthAnchor.constraint(equalToConstant: 24),
            spendingView.widthAnchor.constraint(equalToConstant: 24)
            
        ])
        
    }
    
}

private extension ActivitySummaryView {


    func configureSubviews() {

        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

        
        ])
    }
}



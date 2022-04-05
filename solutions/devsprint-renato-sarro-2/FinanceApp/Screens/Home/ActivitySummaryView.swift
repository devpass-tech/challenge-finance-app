//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct ActivitySummaryInfo {
    let balance: String
    let savings: String
    let spending: String
}

protocol ActivitySummaryProtocol {
    func updateInfo(with info: ActivitySummaryInfo)
}

final class ActivitySummaryView: UIView, ViewConfiguration, ActivitySummaryProtocol {
    
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
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var savingsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var savingsView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Savings"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var amountSavingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var spendingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var spendingView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Spending"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var amountSpedingLabel: UILabel = {
        let label = UILabel()
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

    func updateInfo(with info: ActivitySummaryInfo) {
        amountLabel.text = info.balance
        amountSavingsLabel.text = info.savings
        amountSpedingLabel.text = info.spending
    }
    
    func configViews() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    
    func buildViews() {
        addSubview(headerStack)
        
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
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            savingsView.widthAnchor.constraint(equalToConstant: 24),
            savingsView.heightAnchor.constraint(equalToConstant: 24),
            savingsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            amountSavingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            spendingView.widthAnchor.constraint(equalToConstant: 24),
            spendingView.heightAnchor.constraint(equalToConstant: 24),
            spendingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
        
    }
    
}



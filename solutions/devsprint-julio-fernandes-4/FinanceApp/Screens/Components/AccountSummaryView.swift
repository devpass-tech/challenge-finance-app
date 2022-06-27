//
//  AccountSummaryView.swift
//  FinanceApp
//
//  Created by Guilherme Golfetto on 26/06/22.
//

import UIKit

class AccountSummaryView: UIView {
    
    let ballSize:CGFloat = 15
    
    private lazy var balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    private lazy var greenBall: UIView = {
        let view = UIView()
        view.bounds = CGRect(x: 0, y: 0, width: ballSize, height: ballSize)
        view.layer.cornerRadius = view.frame.width / 2
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var savingsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Savings"
        return label
    }()
    
    private lazy var savingsValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var redBall: UIView = {
        let view = UIView()
        view.bounds = CGRect(x: 0, y: 0, width: ballSize, height: ballSize)
        view.layer.cornerRadius = view.frame.width / 2
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var spendingTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Spending"
        return label
    }()
    
    private lazy var spendingValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var viewModel: AccountSummaryViewModel!
    
    init(viewModel: AccountSummaryViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        configure()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(balanceTitleLabel)
        addSubview(greenBall)
        addSubview(savingsTitle)
        addSubview(savingsValue)
        addSubview(redBall)
        addSubview(spendingTitle)
        addSubview(spendingValue)
        
        balanceTitleLabel.text = viewModel.balance
        savingsValue.text = viewModel.savings
        spendingValue.text = viewModel.spending
        
        let padding:CGFloat = 30
        
        NSLayoutConstraint.activate([
            balanceTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            balanceTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            balanceTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            balanceTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            greenBall.topAnchor.constraint(equalTo: balanceTitleLabel.bottomAnchor, constant: 30),
            greenBall.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            greenBall.widthAnchor.constraint(equalToConstant: ballSize),
            greenBall.heightAnchor.constraint(equalToConstant: ballSize),
            
            savingsTitle.centerYAnchor.constraint(equalTo: greenBall.centerYAnchor),
            savingsTitle.leadingAnchor.constraint(equalTo: greenBall.trailingAnchor, constant: 8),
            savingsTitle.widthAnchor.constraint(equalToConstant: 250),
            savingsTitle.heightAnchor.constraint(equalToConstant: 30),
            
            savingsValue.centerYAnchor.constraint(equalTo: greenBall.centerYAnchor),
            savingsValue.leadingAnchor.constraint(equalTo: savingsTitle.trailingAnchor, constant: 8),
            savingsValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            savingsValue.heightAnchor.constraint(equalToConstant: 30),
            
            redBall.topAnchor.constraint(equalTo: greenBall.bottomAnchor, constant: 40),
            redBall.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            redBall.widthAnchor.constraint(equalToConstant: ballSize),
            redBall.heightAnchor.constraint(equalToConstant: ballSize),
            
            spendingTitle.centerYAnchor.constraint(equalTo: redBall.centerYAnchor),
            spendingTitle.leadingAnchor.constraint(equalTo: redBall.trailingAnchor, constant: 8),
            spendingTitle.widthAnchor.constraint(equalToConstant: 250),
            spendingTitle.heightAnchor.constraint(equalToConstant: 30),
            
            spendingValue.centerYAnchor.constraint(equalTo: redBall.centerYAnchor),
            spendingValue.leadingAnchor.constraint(equalTo: spendingTitle.trailingAnchor, constant: 8),
            spendingValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            spendingValue.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
}

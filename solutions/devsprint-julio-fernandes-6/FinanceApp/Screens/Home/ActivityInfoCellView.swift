//
//  ActivityInfoCellView.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/09/22.
//

import UIKit

class ActivityInfoCellView: UITableViewCell {
    
    static let cellIdentifier = "ActivityInfoCellView"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(savingsStackView)
        stackView.addArrangedSubview(spendingStackView)
        return stackView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "$15,459.27"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()

    private lazy var savingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.addArrangedSubview(savingsView)
        stackView.addArrangedSubview(savingsLabel)
        stackView.addArrangedSubview(savingsValueLabel)
        return stackView
    }()
    
    private lazy var savingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.backgroundColor = .green
        return view
    }()

    private lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var savingsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "$100.00"
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()

    private lazy var spendingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.addArrangedSubview(spendingView)
        stackView.addArrangedSubview(spendingLabel)
        stackView.addArrangedSubview(spendingValueLabel)
        return stackView
    }()

    private lazy var spendingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Spending"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var spendingValueLabel: UILabel = {
        let label = UILabel()
        label.text = "$100.00"
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

//MARK: - Extension and Protocol
extension ActivityInfoCellView: ViewCodeProtocol {

    func buildViewHierarchy() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
        ])
        
        NSLayoutConstraint.activate([
            savingsView.widthAnchor.constraint(equalToConstant: 8),
            savingsView.heightAnchor.constraint(equalToConstant: 8),
        ])
        
        NSLayoutConstraint.activate([
            spendingView.widthAnchor.constraint(equalToConstant: 8),
            spendingView.heightAnchor.constraint(equalToConstant: 8),
        ])
        
    }
}

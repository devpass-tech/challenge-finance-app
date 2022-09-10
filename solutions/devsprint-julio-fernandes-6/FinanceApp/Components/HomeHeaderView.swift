//
//  HomeHeaderView.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/09/22.
//

import UIKit

final class HomeHeaderView: UIView {
    
    let viewSize: CGFloat = 8

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
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
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(savingsView)
        stackView.addArrangedSubview(savingsLabel)
        stackView.addArrangedSubview(savingsValueLabel)
        return stackView
    }()
    
    private lazy var savingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()

    private lazy var spendingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(spendingView)
        stackView.addArrangedSubview(spendingLabel)
        stackView.addArrangedSubview(spendingValueLabel)
        return stackView
    }()
    
    private lazy var spendingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

// MARK: ViewCodeProtocol
extension HomeHeaderView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            savingsView.widthAnchor.constraint(equalToConstant: viewSize),
            savingsView.heightAnchor.constraint(equalToConstant: viewSize),
            spendingView.widthAnchor.constraint(equalToConstant: viewSize),
            spendingView.heightAnchor.constraint(equalToConstant: viewSize),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        savingsView.layer.cornerRadius = viewSize / 2
        spendingView.layer.cornerRadius = viewSize / 2
    }
}

extension HomeHeaderView {
    func setupView(balance: Float, savings: Float, spending: Float) {
        label.text = "$\(balance)"
        savingsValueLabel.text = "$\(savings)"
        spendingValueLabel.text = "$\(spending)"
    }
}

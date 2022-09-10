//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol TransferViewDelegate: AnyObject {
    func didPressChooseContactButton()
    func didPressTransferButton()
}

final class TransfersView: UIView {

    weak var delegate: TransferViewDelegate?

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(chooseContactButton)
        return stackView
    }()

    private lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "$0"
        textField.font = UIFont.boldSystemFont(ofSize: 34)
        textField.textAlignment = .center
        textField.keyboardType = .numbersAndPunctuation
        return textField
    }()

    private lazy var chooseContactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose contact", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(chooseContact), for: .touchUpInside)
        return button
    }()

    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Transfer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
        return button
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
extension TransfersView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(stackView)
        addSubview(transferButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            transferButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            transferButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            transferButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            transferButton.heightAnchor.constraint(equalToConstant: 56)
        ])

    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

// MARK: Actions
extension TransfersView {
    
    @objc func chooseContact() {
        delegate?.didPressChooseContactButton()
    }

    @objc func transfer() {
        delegate?.didPressTransferButton()
    }
}

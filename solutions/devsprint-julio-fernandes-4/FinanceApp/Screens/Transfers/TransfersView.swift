//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersView: UIView {
    
    // MARK: - ViewCode Components
    private lazy var transfersStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        
        stackView.addArrangedSubview(transferTextField)
        stackView.addArrangedSubview(chooseContactStackView)
        
        return stackView
    }()
    
    private lazy var chooseContactStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        stackView.addArrangedSubview(chooseContactLabel)
        stackView.addArrangedSubview(chooseContactButton)
        
        return stackView
    }()
    
    private lazy var transferTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "$0"
        textField.font = .boldSystemFont(ofSize: 26)
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    private lazy var chooseContactLabel: UILabel = {
        let label = UILabel()
        label.text = "To"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var chooseContactButton: UIButton = {
        let image = UIImage(systemName: "circle.fill")
        let button = UIButton()
        
        button.setTitle("Choose Contact", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setImage(image, for: .normal)
        button.tintColor = .green
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Transfer", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Functions
    func setup() {
        setupLayout()
        addTargets()
    }
    
    func addTargets() {
        chooseContactButton.addTarget(self, action: #selector(didClickChooseContact), for: .touchUpInside)
        transferButton.addTarget(self, action: #selector(didClickTransfer), for: .touchUpInside)
        transferTextField.addTarget(self, action: #selector(didTransferTextFieldStartEditing(_:)), for: .allEditingEvents)
    }
    
    @objc func didClickChooseContact() {}
    
    @objc func didClickTransfer() {}
    
    @objc func didTransferTextFieldStartEditing(_ sender: UITextField) {}
}

extension TransfersView {
    func setupLayout() {
        backgroundColor = .white
        
        setupTransfersStackView()
        transferButtonConstraints()
        transferTextFieldConstraints()
        chooseContactViewConstraints()
    }
    
    // MARK: - ViewCode Constraints
    private func setupTransfersStackView() {
        addSubview(transfersStackView)

        NSLayoutConstraint.activate([
            transfersStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            transfersStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            transfersStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transfersStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
         ])
    }
    
    private func transferButtonConstraints() {
        addSubview(transferButton)

        NSLayoutConstraint.activate([
            transferButton.heightAnchor.constraint(equalToConstant: 50),
            transferButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            transferButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            transferButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func transferTextFieldConstraints() {
        NSLayoutConstraint.activate([
            transferTextField.heightAnchor.constraint(equalToConstant: 40),
            transferTextField.centerXAnchor.constraint(equalTo: transfersStackView.centerXAnchor)
        ])
    }
    
    private func chooseContactViewConstraints() {
        NSLayoutConstraint.activate([
            chooseContactStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

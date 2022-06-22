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
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Functions
    func didClickChooseContact() {}
    
    func didClickTransfer() {}
}

extension TransfersView {
    func setupLayout() {
        backgroundColor = .white
        addSubview(transfersStackView)
        addSubview(transferButton)
        
        setupConstraints()
    }
    
    // MARK: - ViewCode Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            transfersStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            transfersStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            transfersStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transfersStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            transferButton.heightAnchor.constraint(equalToConstant: 50),
            transferButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            transferButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            transferButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            transferTextField.heightAnchor.constraint(equalToConstant: 40),
            transferTextField.centerXAnchor.constraint(equalTo: transfersStackView.centerXAnchor),
            chooseContactStackView.heightAnchor.constraint(equalToConstant: 40)
         ])
    }
}

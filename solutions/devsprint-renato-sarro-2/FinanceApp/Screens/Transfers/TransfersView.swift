//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol TransferViewProtocol {
    func getResponseTransferApi()
}

class TransfersView: UIView,TransferViewProtocol, ViewConfiguration {
    
    lazy var viewController: TransferViewControllerProtocol = {
        return TransfersViewController(service: TransferService())
    }()
    
    
    lazy var transferValueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "$0"
        textField.font = textField.font?.withSize(34)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var chooseContactStackView: UIStackView = {
        let contactView = UIStackView()
        contactView.axis = .horizontal
        contactView.spacing = 13
        contactView.translatesAutoresizingMaskIntoConstraints = false
        return contactView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        label.textColor  = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        return label
    }()

    lazy var chooseContactButton: UIButton = {
    let button = UIButton()
        button.setTitle("Choose contact", for: .normal)
        button.setImage(UIImage(named: "greenSymbol"), for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.layer.cornerRadius = 18
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets.right = 13
        button.contentEdgeInsets.left = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var transferButton: UIButton = {
        let button = UIButton()
        button.setTitle("Transfer", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        button.addTarget(self, action: #selector(chamaFetch), for: .touchUpInside)
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func chamaFetch() {
        viewController.chamaFeFe()
    }
    
    func getResponseTransferApi() {
        
    }
    
    func configViews() {
        backgroundColor  = .white
    }
    
    func buildViews() {
        [transferValueTextField,chooseContactStackView,transferButton].forEach(addSubview)
        [textLabel, chooseContactButton].forEach(chooseContactStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            chooseContactButton.heightAnchor.constraint(equalToConstant: 38),
            chooseContactStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseContactStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            transferValueTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            transferValueTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            transferValueTextField.bottomAnchor.constraint(equalTo: chooseContactButton.topAnchor, constant: -14),
            
            transferButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            transferButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            transferButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            transferButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

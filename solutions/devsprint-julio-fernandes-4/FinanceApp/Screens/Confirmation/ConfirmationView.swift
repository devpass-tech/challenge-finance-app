//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView {
    
    //MARK: Elements Visual
    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "checkmark.circle.fill")
        image.tintColor = .green
        
        return image
    }()
    
    
    private lazy var  confirmationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Your transfer was successful"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        
        return lb
    }()
    
    
    private lazy var  confirmationButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .systemBlue
        bt.setTitle("Nice", for: .normal)
        bt.layer.cornerRadius = 15
        
        return bt
    }()

    
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white // backgroundColor View
        
        setComponentsVisual()
    }
    
    
    
    //Obligatory
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: Function - Components
    private func setComponentsVisual () {
        setConfirmationLabel()
        setConfirmationButton()
    }
    
    
    private func setConfirmationLabel() {
        self.addSubview(checkImage)
        self.addSubview(confirmationLabel)
        
        
        NSLayoutConstraint.activate([
            checkImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkImage.heightAnchor.constraint(equalToConstant: 100),
            checkImage.widthAnchor.constraint(equalToConstant: 100),
            
            confirmationLabel.topAnchor.constraint(equalTo: checkImage.bottomAnchor, constant: 20),
            confirmationLabel.centerXAnchor.constraint(equalTo: checkImage.centerXAnchor),
        ])
    }
    
    
    private func setConfirmationButton() {
        self.addSubview(confirmationButton)
        
        NSLayoutConstraint.activate([
            confirmationButton.centerYAnchor.constraint(equalTo: confirmationButton.centerYAnchor),
            confirmationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            confirmationButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            confirmationButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            confirmationButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

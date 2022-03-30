//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
//import XCTest

class ConfirmationView: UIView {
    
    lazy var imageConfirmation: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "checkmark.circle.fill")
        image.tintColor = UIColor(cgColor: .init(red: 0.190, green: 0.840, blue: 0.297, alpha: 1))
        return image
    }()
    
    lazy var titleConfirmation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your transfer was successful"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        
        
        return label
    }()
    
    lazy var niceConfirmation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nice", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = UIColor(cgColor: .init(red: 0.190, green: 0.840, blue: 0.297, alpha: 1))
        button.layer.cornerRadius = 15
        
        return button
        
    }()
    
    init() {
        super.init(frame: .zero)
        configViews()
        biuldViews()
        configConstraintsImage()
        configConstraintsTitle()
        configConstraintsNice()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = UIColor.white
    }
    
    func biuldViews() {
        addSubview(imageConfirmation)
        addSubview(titleConfirmation)
        addSubview(niceConfirmation)
    }
    func configConstraintsImage() {
        NSLayoutConstraint.activate([
            imageConfirmation.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageConfirmation.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageConfirmation.widthAnchor.constraint(equalToConstant: 64),
            imageConfirmation.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    func configConstraintsTitle() {
        NSLayoutConstraint.activate([
            
            titleConfirmation.topAnchor.constraint(equalTo: imageConfirmation.bottomAnchor, constant: 8),
            titleConfirmation.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleConfirmation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleConfirmation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleConfirmation.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    func configConstraintsNice() {
        NSLayoutConstraint.activate([
            
            niceConfirmation.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            niceConfirmation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            niceConfirmation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            niceConfirmation.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
}

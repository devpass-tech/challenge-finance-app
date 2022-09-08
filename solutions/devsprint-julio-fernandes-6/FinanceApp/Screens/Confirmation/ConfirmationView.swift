//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//
import UIKit

class ConfirmationView: UIView, ViewCodeProtocol {
    
    init() {
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func buildViewHierarchy() {
        addSubview(checkNSuccess)
        addSubview(niceButton)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var checkNSuccess: UIStackView = {
           let stack = UIStackView(frame: .zero)
           stack.translatesAutoresizingMaskIntoConstraints = false
           stack.axis = .vertical
           stack.alignment = .center
           stack.spacing = 5
           stack.distribution = .fill
           stack.addArrangedSubview(check)
           stack.addArrangedSubview(successText)
           
           return stack
        }()
   
   lazy var check: UIImageView = {
       
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.image = UIImage(named: "checkmark.circle.fill")
       image.tintColor = .green
       return image
       
       
   }()
   
   lazy var successText: UILabel = {
       
       let text = UILabel()
       text.translatesAutoresizingMaskIntoConstraints = false
       text.text = "Your transfer was successful"
       text.font = UIFont.init(name: "SF Pro Text", size: 16)
       text.textColor = .black
       
       return text
   }()
   
   lazy var niceButton: UIButton = {

       let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
       button.backgroundColor = .systemBlue
       button.setTitle("Nice", for: .normal)
       button.layer.cornerRadius = 15

       return button
   }()
}

extension ConfirmationView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
                   checkNSuccess.centerXAnchor.constraint(equalTo: centerXAnchor),
                   checkNSuccess.centerYAnchor.constraint(equalTo: centerYAnchor)
               ])
               
               NSLayoutConstraint.activate([
                   check.heightAnchor.constraint(equalToConstant: 100),
                   check.widthAnchor.constraint(equalToConstant: 100),
               ])
                       
               NSLayoutConstraint.activate([
                   niceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
                   niceButton.heightAnchor.constraint(equalToConstant: 44),
                   niceButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
                   niceButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
                   
               ])
    }
}

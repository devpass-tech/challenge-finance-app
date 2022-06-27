//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ConfirmationView: UIView, ConfigurableView {

    //MARK: Elements Visual
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5
        stack.distribution = .fill
        stack.addArrangedSubview(checkImage)
        stack.addArrangedSubview(confirmationLabel)
        
        return stack
     }()

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
        return nil
    }
    
    //MARK: Init - Components
    private func setComponentsVisual () {
        initLayout()
    }

}


//MARK: Components and Constraints
extension ConfirmationView {
    func initSubviews() {
        addSubview(vStack)
        addSubview(confirmationButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            checkImage.heightAnchor.constraint(equalToConstant: 100),
            checkImage.widthAnchor.constraint(equalToConstant: 100),
        ])
                
        NSLayoutConstraint.activate([
            confirmationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            confirmationButton.heightAnchor.constraint(equalToConstant: 44),
            confirmationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            confirmationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
        ])
    }
    
}

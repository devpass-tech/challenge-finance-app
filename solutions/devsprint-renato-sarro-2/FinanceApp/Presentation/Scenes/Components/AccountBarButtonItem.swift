//
//  AccountBarButtonItem.swift
//  FinanceApp
//
//  Created by Bruno Guirra on 30/03/22.
//

import UIKit

final class AccountBarButtonItem: UIView {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "avatar-placeholder"), for: .normal)
        
        return button
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountBarButtonItem: ViewConfiguration {
    func configViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
    }
    
    func buildViews() {
        self.addSubview(button)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 36),
            self.widthAnchor.constraint(equalToConstant: 36),
            
            button.heightAnchor.constraint(equalTo: self.heightAnchor),
            button.widthAnchor.constraint(equalTo: self.widthAnchor),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

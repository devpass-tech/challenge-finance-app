//
//  AccountBarButtonItem.swift
//  FinanceApp
//
//  Created by Bruno Guirra on 30/03/22.
//

import UIKit

final class AccountNavigationBarButton: UIView {
    
    private let origin: UIViewController
    private let destination: UIViewController
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "avatar-placeholder"), for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            
            self.origin.navigationController?.present(self.destination, animated: true)
        }), for: .primaryActionTriggered)
        return button
    }()

    init(from origin: UIViewController, to destination: UIViewController) {
        self.origin = origin
        self.destination = destination
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountNavigationBarButton: ViewConfiguration {
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

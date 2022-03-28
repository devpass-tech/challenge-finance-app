//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView {
    
    lazy var imageConfirmation: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "checkmark.circle.fill")
        
        
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        bildViews()
        configConstraints()
        configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = UIColor.white
    }
    
    func bildViews() {
        addSubview(imageConfirmation)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.imageConfirmation.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageConfirmation.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageConfirmation.widthAnchor.constraint(equalToConstant: 100),
            self.imageConfirmation.heightAnchor.constraint(equalToConstant: 100)
        
        ])
    
    }
}

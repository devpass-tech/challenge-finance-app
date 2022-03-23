//
//  LoadingView.swift
//  FinanceApp
//
//  Created by cassia franco on 21/03/22.
//

import UIKit

class LoadingView: UIView, ViewConfiguration {
    func configViews() {
    }
    
    func buildViews() {
    }
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Buscando informações..."
        label.font = UIFont.init(name: " SF Pro Text", size: 16)
        return label
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .large
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    internal func setupViews() {
        self.backgroundColor = .white
        self.addSubview(self.activityIndicator)
        self.addSubview(self.descriptionLabel)
    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.activityIndicator.centerXAnchor),
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.activityIndicator.centerYAnchor, constant: -40),
            
            self.activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
    }

}

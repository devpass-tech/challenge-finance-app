//
//  LoadingViewController.swift
//  FinanceApp
//
//  Created by Anita Spieker on 01/09/22.
//

import UIKit

class LoadingView: UIView, ViewCodeProtocol {
    func buildViewHierarchy() {
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.activityIndicator)
        self.setupConstraints()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Buscando informações..."
        label.font = UIFont.init(name: "SF Pro Text", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .large
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buildViewHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.activityIndicator.centerYAnchor,constant: -40),
            
            self.activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
}



//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct ActivityDetailsConfiguration {

    let activity: Activity
}

class ActivityDetailsView: UIView {
    
    private let icon = UIImageView()
    private let titleLabel = UILabel()
    private let categoryLabel = UILabel()
    private let priceLabel = UILabel()
    private let timeLabel = UILabel()
    private let reportButton = UIButton(type: .system)
    
    init() {
        super.init(frame: .zero)

        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ActivityDetailsView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureComponents()
        self.mockComponents()
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    
    func configureComponents() {
        icon.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
        icon.tintColor = .systemPurple
        icon.clipsToBounds = true
        icon.layer.masksToBounds = true
        icon.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        
        categoryLabel.font = UIFont.systemFont(ofSize: 15)
        categoryLabel.textColor = .black.withAlphaComponent(0.6)
        
        priceLabel.font = UIFont.boldSystemFont(ofSize: 34)
        priceLabel.textColor = .black.withAlphaComponent(0.6)
        
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.textColor = .black.withAlphaComponent(0.6)
        
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.setTitle("Report a issue", for: .normal)
        reportButton.setTitleColor(.white, for: .normal)
        reportButton.backgroundColor = .systemBlue
        reportButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        reportButton.clipsToBounds = true
        reportButton.layer.cornerRadius = 14
        reportButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    func mockComponents(){
        titleLabel.text = "Mall"
        categoryLabel.text = "Shopping"
        priceLabel.text = "R$100.00"
        timeLabel.text = "8:57 AM"
    }

    func configureSubviews() {
        
        self.addSubview(self.icon)
        self.addSubview(self.titleLabel)
        self.addSubview(self.categoryLabel)
        self.addSubview(self.priceLabel)
        self.addSubview(self.timeLabel)
        self.addSubview(self.reportButton)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
//            self.icon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.icon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.icon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//
//            self.titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            self.titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            self.titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//
//            self.categoryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            self.categoryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            self.categoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            self.categoryLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//
//            self.priceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            self.priceLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.priceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),

//            self.timeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            self.timeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            self.timeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            self.timeLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.reportButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            self.reportButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            self.priceLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 24),
            self.reportButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.reportButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}


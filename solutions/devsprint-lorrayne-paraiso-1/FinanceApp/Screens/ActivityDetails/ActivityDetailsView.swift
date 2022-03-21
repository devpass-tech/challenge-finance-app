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
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
        icon.tintColor = .systemPurple
        icon.clipsToBounds = true
        icon.layer.masksToBounds = true
        icon.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.systemFont(ofSize: 15)
        categoryLabel.textColor = .black.withAlphaComponent(0.6)
        categoryLabel.textAlignment = .center
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.boldSystemFont(ofSize: 34)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .center
       
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.textColor = .black.withAlphaComponent(0.6)
        timeLabel.textAlignment = .center
        
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
        priceLabel.text = "$100.00"
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
            self.icon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.icon.heightAnchor.constraint(equalToConstant: 100.0),
            self.icon.widthAnchor.constraint(equalToConstant: 100.0),

            self.titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 156.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -156.0),
            self.titleLabel.topAnchor.constraint(equalTo: self.icon.bottomAnchor, constant: 8.0),
            
            self.categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            self.categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            self.categoryLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8.0),
            

            self.priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            self.priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            self.priceLabel.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor, constant: 132.0),
            

            self.timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            self.timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            self.timeLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 8.0),
            
            self.reportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            self.reportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            self.reportButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -36),
            self.reportButton.heightAnchor.constraint(equalToConstant: 56.0)
        ])
    }
}


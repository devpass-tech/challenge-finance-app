//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView, ViewConfiguration {
    
    lazy var activityImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bag.circle.fill")
        image.tintColor = UIColor(red: 175/255, green: 82/255, blue: 222/255, alpha: 1)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textAlignment = .center
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var reportButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Report a issue", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        return button
    }()
        
    lazy var headStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.buildViews()
        self.configViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        self.addSubview(self.headStackView)
        self.addSubview(self.bodyStackView)
        self.headStackView.addArrangedSubview(self.activityImage)
        self.headStackView.addArrangedSubview(self.nameLabel)
        self.headStackView.addArrangedSubview(self.categoryLabel)
        self.bodyStackView.addArrangedSubview(self.priceLabel)
        self.bodyStackView.addArrangedSubview(self.timeLabel)
        self.addSubview(self.reportButton)
            }
    
    func buildViews() {
        self.backgroundColor = .white
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([


            self.headStackView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 34),
            self.headStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.headStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.activityImage.heightAnchor.constraint(equalToConstant: 100),
            self.activityImage.widthAnchor.constraint(equalToConstant: 100),

            self.bodyStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.bodyStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            self.priceLabel.widthAnchor.constraint(equalToConstant: 413),

            self.timeLabel.widthAnchor.constraint(equalToConstant: 413),

            self.reportButton.heightAnchor.constraint(equalToConstant: 56),
            self.reportButton.leadingAnchor.constraint(equalTo: self.headStackView.leadingAnchor),
            self.reportButton.trailingAnchor.constraint(equalTo: self.headStackView.trailingAnchor),
            self.reportButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -17.5)

        ])
    }
    
}

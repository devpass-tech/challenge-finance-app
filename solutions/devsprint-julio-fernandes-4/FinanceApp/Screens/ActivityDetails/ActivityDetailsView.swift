//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView {
    
    //MARK: View Life Cycle
    func setupView() {
        backgroundColor = .white
        addSubview(reportIssueButton)
        addSubview(bagImage)
        addSubview(mallLabel)
        addSubview(shoppingLabel)
        addSubview(valueLabel)
        addSubview(hourLabel)
        setupConstraints()
    }
    
    // MARK: Interface Elements
    private lazy var bagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bag.circle.fill")
        image.contentMode = .scaleAspectFill
        image.tintColor = UIColor(red: 190/255, green: 81/255, blue: 255/255, alpha: 1)
        return image
    }()

    private lazy var mallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mall"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var shoppingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shopping"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$100.00"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .black
        return label
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8:57 AM"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    private lazy var reportIssueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Report issue", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(UIColor.white , for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return button
    }()
    
    //MARK: Functions
    @objc func tappedButton(sender: UIButton) {
        print("action disparada")
    }
    
    // MARK: Interface Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            reportIssueButton.widthAnchor.constraint(equalToConstant: 300),
            reportIssueButton.heightAnchor.constraint(equalToConstant: 50),
            reportIssueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            reportIssueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bagImage.widthAnchor.constraint(equalToConstant: 150),
            bagImage.heightAnchor.constraint(equalToConstant: 150),
            bagImage.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            bagImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mallLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mallLabel.topAnchor.constraint(equalTo: bagImage.bottomAnchor, constant: 20),
            
            shoppingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            shoppingLabel.topAnchor.constraint(equalTo: mallLabel.bottomAnchor, constant: 10),
            
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: shoppingLabel.bottomAnchor, constant: 100),
            
            hourLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            hourLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
        ])
    }

}

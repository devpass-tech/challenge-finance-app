//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    
    //    override func loadView() {
    //        self.view = ActivityDetailsView()
    //    }
    
    lazy var bagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bag.circle.fill")
        image.contentMode = .scaleAspectFill
        image.tintColor = UIColor(red: 190/255, green: 81/255, blue: 255/255, alpha: 1)
        return image
    }()
    
    lazy var reportIssueButton: UIButton = {
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
    
    lazy var mallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mall"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var shoppingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shopping"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$100.00"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .black
        return label
    }()
    
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8:57 AM"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    
    @objc func tappedButton(sender: UIButton) {
        print("action disparada")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.reportIssueButton)
        self.view.addSubview(self.bagImage)
        self.view.addSubview(self.mallLabel)
        self.view.addSubview(self.shoppingLabel)
        self.view.addSubview(self.valueLabel)
        self.view.addSubview(self.hourLabel)
        self.configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.reportIssueButton.widthAnchor.constraint(equalToConstant: 300),
            self.reportIssueButton.heightAnchor.constraint(equalToConstant: 50),
            self.reportIssueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            self.reportIssueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.bagImage.widthAnchor.constraint(equalToConstant: 150),
            self.bagImage.heightAnchor.constraint(equalToConstant: 150),
            self.bagImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.bagImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.mallLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mallLabel.topAnchor.constraint(equalTo: bagImage.bottomAnchor, constant: 20),
            
            self.shoppingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.shoppingLabel.topAnchor.constraint(equalTo: mallLabel.bottomAnchor, constant: 10),
            
            self.valueLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.valueLabel.topAnchor.constraint(equalTo: shoppingLabel.bottomAnchor, constant: 100),
            
            self.hourLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.hourLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
        ])
    }
}


//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView {
    
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        initLayout()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    
    // MARK: Interface Elements
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = 10
        stack.axis = .vertical
        stack.addArrangedSubview(bagImage)
        stack.addArrangedSubview(mallLabel)
        stack.addArrangedSubview(shoppingLabel)
        return stack
    }()
    
    private lazy var vCenterStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = 10
        stack.axis = .vertical
        stack.addArrangedSubview(valueLabel)
        stack.addArrangedSubview(hourLabel)
        return stack
    }()
    
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
}


extension ActivityDetailsView: ConfigurableView {
    func initSubviews() {
        addSubview(vStack)
        addSubview(vCenterStack)
        addSubview(reportIssueButton)
    }
    
    // MARK: Interface Constraints
     func initConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            bagImage.widthAnchor.constraint(equalToConstant: 150),
            bagImage.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            vCenterStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vCenterStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            reportIssueButton.heightAnchor.constraint(equalToConstant: 44),
            reportIssueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            reportIssueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            reportIssueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            reportIssueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
}

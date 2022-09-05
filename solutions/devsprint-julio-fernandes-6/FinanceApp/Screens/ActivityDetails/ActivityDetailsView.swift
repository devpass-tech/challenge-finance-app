//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView {
    
    lazy var iconInfoVStack = UIStackView()
    
    lazy var categoryIcon = UIImageView()
    lazy var activityNameLabel = UILabel()
    lazy var activityCategoryLabel = UILabel()
    
    lazy var amountInformationVStack = UIStackView()
    lazy var amountLabel = UILabel()
    lazy var timeLabel = UILabel()
    
    lazy var reportIssueButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ActivityDetailsView {
    
    private func setupLayout() {
        //        MARK: - Add views sections
        
        addSubview(iconInfoVStack)
        iconInfoVStack.addArrangedSubview(categoryIcon)
        iconInfoVStack.addArrangedSubview(activityNameLabel)
        iconInfoVStack.addArrangedSubview(activityCategoryLabel)
        
        addSubview(amountInformationVStack)
        amountInformationVStack.addArrangedSubview(amountLabel)
        amountInformationVStack.addArrangedSubview(timeLabel)
        
        addSubview(reportIssueButton)
        
        
        NSLayoutConstraint.activate([
            
            //        MARK: - Setup vStack constraints
            iconInfoVStack.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 12),
            iconInfoVStack.widthAnchor.constraint(equalToConstant: 100),
            iconInfoVStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //            MARK: - Setup categoryIcon constraints
            categoryIcon.widthAnchor.constraint(equalToConstant: 80),
            categoryIcon.heightAnchor.constraint(equalToConstant: 80),
            
            //            MARK: - Setup amountInformationVStack constraints
            
            amountInformationVStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            amountInformationVStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //            MARK: - Setup reportIssueButton constraints
            
            reportIssueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            reportIssueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reportIssueButton.heightAnchor.constraint(equalToConstant: 45),
            reportIssueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            reportIssueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80)
            

            
            
        ])
    }
    
    private func setupStyle() {
        backgroundColor = .white
        
        //      MARK:  - Stack view
        
        iconInfoVStack.translatesAutoresizingMaskIntoConstraints = false
        iconInfoVStack.axis = .vertical
        iconInfoVStack.spacing = 3
        iconInfoVStack.alignment = .center
        
        //        MARK: - Icon view
        
        categoryIcon.translatesAutoresizingMaskIntoConstraints = false
        categoryIcon.image = UIImage(named: "bag.circle.fill")
        categoryIcon.tintColor = .systemPurple
        
        //       MARK: - activityNameLabel view
        
        activityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        activityNameLabel.text = "Mall"
        activityNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        
        //        MARK: - activityCategoryLabel view
        
        activityCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        activityCategoryLabel.text = "Shopping"
        activityCategoryLabel.textColor = .systemGray2
        
        //        MARK: - amountInformationVStack view
        
        amountInformationVStack.translatesAutoresizingMaskIntoConstraints = false
        amountInformationVStack.axis = .vertical
        amountInformationVStack.spacing = 8
        amountInformationVStack.alignment = .center
        
        //        MARK: - amountLabel view
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.text = "$100.00"
        amountLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        //        MARK: - timeLabel view
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "8:57 AM"
        timeLabel.textColor = .systemGray2
        
        //        MARK: - reportIssueButton view
        
        reportIssueButton.translatesAutoresizingMaskIntoConstraints = false
        reportIssueButton.setTitle("Report a issue", for: [])
        reportIssueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        reportIssueButton.tintColor = .white
        reportIssueButton.backgroundColor = .systemBlue
        reportIssueButton.clipsToBounds = true
        reportIssueButton.layer.cornerRadius = 8

        
        
        
    }
}

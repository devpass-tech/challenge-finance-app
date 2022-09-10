//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ActivityDetailsViewDelegate: AnyObject {
    func didPressReportIssueButton()
}

final class ActivityDetailsView: UIView {
    
    private lazy var iconInfoVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 3
        stack.alignment = .center
        stack.addArrangedSubview(categoryIcon)
        stack.addArrangedSubview(activityNameLabel)
        stack.addArrangedSubview(activityCategoryLabel)
        return stack
    }()
    
    private lazy var categoryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bag.circle.fill")
        image.tintColor = .systemPurple
        return image
    }()
    
    private lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    private lazy var activityCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shopping"
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var amountInformationVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.addArrangedSubview(amountLabel)
        stack.addArrangedSubview(timeLabel)
        return stack
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var reportIssueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Report a issue", for: [])
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(reportIssueButtonAction), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    weak var delegate: ActivityDetailsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

// MARK: ViewCodeProtocol
extension ActivityDetailsView: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        addSubview(iconInfoVStack)
        addSubview(amountInformationVStack)
        addSubview(reportIssueButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconInfoVStack.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 12),
            iconInfoVStack.widthAnchor.constraint(equalToConstant: 200),
            iconInfoVStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryIcon.widthAnchor.constraint(equalToConstant: 80),
            categoryIcon.heightAnchor.constraint(equalToConstant: 80),
            amountInformationVStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            amountInformationVStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            reportIssueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            reportIssueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reportIssueButton.heightAnchor.constraint(equalToConstant: 45),
            reportIssueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            reportIssueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

// MARK: Actions
extension ActivityDetailsView {
    
    @objc func reportIssueButtonAction() {
        delegate?.didPressReportIssueButton()
    }
    
}

// MARK: Setup
extension ActivityDetailsView {
    func setupView(activity: Activity) {
        activityNameLabel.text = activity.name
        amountLabel.text = "$\(activity.price)"
        timeLabel.text = activity.time
    }
}

//
//  ContactCellView.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/09/22.
//

import UIKit

final class ContactCellView: UITableViewCell {

   private lazy var mainStackView: UIStackView = {
       let stack = UIStackView(frame: .zero)
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.spacing = 16
       stack.alignment = .center
       stack.addArrangedSubview(avatarImageView)
       stack.addArrangedSubview(labelsStackView)
       return stack
    }()

    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.addArrangedSubview(contactNameLabel)
        stack.addArrangedSubview(contactPhoneLabel)
        return stack
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "avatar-placeholder")
        return imageView
    }()

    private lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var contactPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension ContactCellView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupAdditionalConfiguration() {
        accessoryType = .disclosureIndicator
    }
    
}

extension ContactCellView {
    func setupCell(_ contact: ContactModel) {
        contactNameLabel.text = contact.name
        contactPhoneLabel.text = contact.phone
    }
}

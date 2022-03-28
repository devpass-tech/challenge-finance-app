//
//  ContactListCell.swift
//  FinanceApp
//
//  Created by Bruno Guirra on 22/03/22.
//

import UIKit

class ContactCellView: UITableViewCell {
    static let identifier = "ContactCell"
    
    var contact: Contact? {
        didSet {
            guard let contact = contact else {
                return
            }
            
            nameLabel.text = contact.name
            
            phoneLabel.text = contact.phone
        }
    }
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.clipsToBounds = true
        return containerView
    }()
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 24
        profileImage.backgroundColor = DSColor.secondary.color
        profileImage.clipsToBounds = true
        return profileImage
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = DSLabel.subheadline(color: .primary).build()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        return nameLabel
    }()
    
    lazy var phoneLabel: UILabel = {
        let phoneLabel = DSLabel.footnote(color: .secondary).build()
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return phoneLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - View Configuration

extension ContactCellView: ViewConfiguration {
    func configViews() {
    }
    
    func buildViews() {
        contentView.addSubview(profileImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(phoneLabel)
        contentView.addSubview(containerView)
    }
    
    func setupConstraints() {
        
        // ProfileImage Constraints
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            profileImage.widthAnchor.constraint(equalToConstant: 48),
            profileImage.heightAnchor.constraint(equalToConstant: 48)
            
        ])
        
        // ContainerView Constraints
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            containerView.heightAnchor.constraint(equalToConstant: 40)
            
        ])

        // NameLabel Constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])
        
        // PhoneLabel Constraints
        NSLayoutConstraint.activate([
            phoneLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
}

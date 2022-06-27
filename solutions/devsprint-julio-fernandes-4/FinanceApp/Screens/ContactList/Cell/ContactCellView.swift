//
//  ContactCellView.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 20/06/22.
//

import UIKit

final class ContactCellView: UITableViewCell, ConfigurableView {
   static let identifier = "ContactCellIdentifier"

   private lazy var container: UIStackView = {
       let container = UIStackView(frame: .zero)
       container.translatesAutoresizingMaskIntoConstraints = false
       container.spacing = 16
       container.alignment = .center
       container.addArrangedSubview(contactImage)
       container.addArrangedSubview(labelsStackView)
       return container
    }()

    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        stack.addArrangedSubview(contactNameLabel)
        stack.addArrangedSubview(contactPhoneLabel)
        return stack
    }()

    lazy var contactImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "avatar-placeholder")
        return imageView
    }()

    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    lazy var contactPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        initLayout()
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    override func prepareForReuse() {
        contactImage.image = UIImage(named: "avatar-placeholder")
        contactNameLabel.text = ""
        contactPhoneLabel.text = ""
    }
    
    func setupCell(contactList: ContactListModel) {
        contactNameLabel.text = contactList.name
        contactPhoneLabel.text = contactList.phone
    }
}

extension ContactCellView {

    func initSubviews() {
        addSubview(container)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),

            contactImage.widthAnchor.constraint(equalToConstant: 50),
            contactImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//
//  ContactCellView.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 20/06/22.
//

import UIKit

class ContactCellView: UITableViewCell, ConfigurableView {
   static let identifier = "ContactCellIdentifier"

   private var container: UIView = {
       let container = UIView(frame: .zero)
       container.translatesAutoresizingMaskIntoConstraints = false
       return container
    }()

    private var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
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
        label.text = "Full Name"
        return label
    }()

    lazy var contactPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "(99) 99999-9999"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactCellView {

    func initSubviews() {
        
        container.addSubviews(contactImage, labelsStackView)
        labelsStackView.addArrangedSubview(contactNameLabel)
        labelsStackView.addArrangedSubview(contactPhoneLabel)
        addSubview(container)
    }

    func initConstraints() {

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 8),

            contactImage.widthAnchor.constraint(equalToConstant: 50),
            contactImage.heightAnchor.constraint(equalToConstant: 50),
            contactImage.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
    }
}

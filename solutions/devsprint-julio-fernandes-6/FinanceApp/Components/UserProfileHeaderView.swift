//
//  UserProfileHeaderView.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/09/22.
//

import UIKit

final class UserProfileHeaderView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(agencyLabel)
        stackView.addArrangedSubview(accountLabel)
        stackView.addArrangedSubview(bankLabel)
        return stackView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar-placeholder")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var agencyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private lazy var bankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

// MARK: ViewCodeProtocol
extension UserProfileHeaderView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
    
}

extension UserProfileHeaderView {
    func setupView(name: String, agency: String, account: String, bank: String) {
        nameLabel.text = name
        agencyLabel.text = "Agency ".appending(agency)
        accountLabel.text = "Account ".appending(account)
        bankLabel.text = bank
    }
}

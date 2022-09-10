//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ConfirmationViewDelegate: AnyObject {
    func didPressNiceButton()
}

final class ConfirmationView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.addArrangedSubview(confirmationImageView)
        stackView.addArrangedSubview(confirmationLabel)
        return stackView
    }()

    private lazy var confirmationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "checkmark.circle.fill")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.tintColor = .systemGreen
        return imageView
    }()

    private lazy var confirmationLabel: UILabel = {
        let label = UILabel()
        label.text = "Your transfer was successful"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    private lazy var confirmationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nice!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(niceButtonDidClick), for: .touchUpInside)
        return button
    }()

    weak var delegate: ConfirmationViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

// MARK: ViewCodeProtocol
extension ConfirmationView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(stackView)
        addSubview(confirmationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            confirmationImageView.heightAnchor.constraint(equalToConstant: 100),
            confirmationImageView.widthAnchor.constraint(equalToConstant: 100),
            confirmationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmationButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            confirmationButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            confirmationButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

// MARK: Actions
extension ConfirmationView {
    @objc func niceButtonDidClick() {
        delegate?.didPressNiceButton()
    }
}

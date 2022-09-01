//
//  ViewCodeProtocol.swift
//  FinanceApp
//
//  Created by Joao Gripp on 01/09/22.
//

import UIKit

protocol ViewCodeProtocol {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

extension ViewCodeProtocol where Self: UITableViewCell {
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
}

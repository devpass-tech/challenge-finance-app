//
//  ViewConfiguration.swift
//  FinanceApp
//
//  Created by Henrique Augusto on 21/03/22.
//

import Foundation

protocol ViewConfiguration {
    func setupViews()
    func configViews()
    func buildViews()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViews() {
        configViews()
        buildViews()
        setupConstraints()
    }
}

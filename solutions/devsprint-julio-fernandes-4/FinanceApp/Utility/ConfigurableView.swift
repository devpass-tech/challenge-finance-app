//
//  ConfigurableView.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 20/06/22.
//

import UIKit

public protocol ConfigurableView {
    func initLayout()
    func initSubviews()
    func initConstraints()
    func setupAdditional()
}

public extension ConfigurableView {
    func initLayout() {
        initSubviews()
        initConstraints()
        setupAdditional()
    }
    func setupAdditional() { }
}

//MARK: UIView extension to add more than one subview
public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach (addSubview)
    }
}

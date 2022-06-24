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
}

public extension ConfigurableView {
    func initLayout() {
        initSubviews()
        initConstraints()
    }
}

//MARK: UIView extension to add more than one subview
public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach (addSubview)
    }
}

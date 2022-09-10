//
//  UINavigationControllerSpy.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 10/09/22.
//

import UIKit

final class UINavigationControllerSpy: UINavigationController {
    
    private(set) var showCalled = false
    override func show(_ vc: UIViewController, sender: Any?) {
        showCalled = true
    }
    
    private(set) var showDetailViewControllerCalled = false
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        showDetailViewControllerCalled = true
    }
}

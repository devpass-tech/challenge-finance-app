//
//  TransfersViewSpy.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 29/03/22.
//

import Foundation

@testable import FinanceApp

class TransfersViewSpy: TransferViewProtocol {
    var delegate: TransferViewControllerProtocol?
    
    var didConfigInitialState: Bool?
    var errorMessage: String?
    
    func configInitalState() {
        didConfigInitialState = true
    }
    
    func showError(message: String) {
        errorMessage = message
    }
}

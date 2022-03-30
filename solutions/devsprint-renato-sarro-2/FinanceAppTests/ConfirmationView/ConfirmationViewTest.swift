//
//  ConfirmationViewTest.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 30/03/22.
//

import Foundation
import XCTest

@testable import FinanceApp

class ConfirmationViewControllerSpy: ConfirmationViewProtocol {
    var didFinishCount: Int = 0
    
    func didFinish() {
        didFinishCount += 1
    }
}

class ConfirmationViewTest: XCTestCase {
    
    var sut: ConfirmationView!
    var spy: ConfirmationViewControllerSpy!
    
    func test_checkIfActionButtonCloseScreen() {
        
        // When
        spy = ConfirmationViewControllerSpy()
        sut = ConfirmationView()
        
        sut.delegate = spy
        
        // Given
        sut.actionButton()
        
        // Then
        XCTAssertEqual(spy.didFinishCount, 1)
    }
    
}

//
//  TransfersTest.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 29/03/22.
//

import Foundation
import XCTest

@testable import FinanceApp

class TransferTest: XCTestCase {
    
    var sut: TransfersViewController!
    
    func test_transferSuccess() {
        var spy = TransfersViewSpy()
        sut = TransfersViewController(service: TransferServiceStub(isSuccess: true), transferView: spy)
        
        sut.chamaFeFe()
        
        XCTAssertTrue(spy.didConfigInitialState!)
        XCTAssertNil(spy.errorMessage)
    }
    
    func test_transferError() {
        var spy = TransfersViewSpy()
        sut = TransfersViewController(service: TransferServiceStub(isSuccess: false), transferView: spy)
        
        sut.chamaFeFe()
        
        XCTAssertFalse(spy.didConfigInitialState ?? false)
        XCTAssertEqual(spy.errorMessage, "Não foi possível realizar a transferência")
    }
}

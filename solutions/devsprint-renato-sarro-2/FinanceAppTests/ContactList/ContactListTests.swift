//
//  ContactListTests.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 23/03/22.
//

import Foundation
import XCTest

@testable import FinanceApp

class ContactListTests: XCTestCase {
    
    func test_ContactListInitialConfig() {
        
        let spy = ContactListSpy()
        var sut: ContactListViewController = ContactListViewController(service: FinanceServiceStub())
        sut.mainView = spy
        
        sut.viewDidLoad()
        
        XCTAssert(!spy.list.isEmpty)
        XCTAssert(spy.list.count == 2)
        
        let firstContact = spy.list.first!
        
        XCTAssert(firstContact.name == "Renato")
    }
}

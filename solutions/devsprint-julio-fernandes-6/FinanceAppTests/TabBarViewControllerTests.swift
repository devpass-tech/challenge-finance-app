//
//  TabBarViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 10/09/22.
//

import XCTest
@testable import FinanceApp

final class TabBarViewControllerTests: XCTestCase {

    var sut: TabBarViewController?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TabBarViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_viewWillAppear() throws {
        sut?.viewWillAppear(false)
        XCTAssertEqual(sut?.viewControllers?.count, 2)
    }

}

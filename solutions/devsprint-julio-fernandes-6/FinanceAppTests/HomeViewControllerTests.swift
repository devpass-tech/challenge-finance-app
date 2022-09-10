//
//  HomeViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 05/09/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewControllerTests: XCTestCase {

    private let serviceSpy = FinanceServiceSpy()
    
    var sut: HomeViewController?
    
    override func setUp() {
        super.setUp()
        sut = HomeViewController()
        sut?.service = serviceSpy
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_loadView() throws {
        sut?.loadView()
        XCTAssertTrue(sut?.view is HomeView)
        
    }
    
    func test_viewDidLoad() {
        sut?.viewDidLoad()
        XCTAssertNotNil(sut?.navigationItem.rightBarButtonItem)
        XCTAssertTrue(serviceSpy.loadCalled)
        XCTAssertEqual(serviceSpy.loadEndpointToBeValue, FinanceEndpoint.home.rawValue)
    }
    
    func test_didSelectedActivity() throws {
        let sut = try XCTUnwrap(sut)
        let nav = UINavigationControllerSpy(rootViewController: sut)
        sut.didSelectedActivity(Activity(name: "", price: 0, time: ""))
        XCTAssertTrue(nav.showCalled)
    }
    
    func test_profileDidClick() throws {
        let sut = try XCTUnwrap(sut)
        let nav = UINavigationControllerSpy(rootViewController: sut)
        sut.profileDidClick()
        XCTAssertTrue(nav.showDetailViewControllerCalled)
    }
    
}

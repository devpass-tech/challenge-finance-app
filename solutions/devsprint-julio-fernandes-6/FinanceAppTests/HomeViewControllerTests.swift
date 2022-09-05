//
//  HomeViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 05/09/22.
//

import XCTest
@testable import FinanceApp

class HomeViewControllerTests: XCTestCase {

    private let serviceSpy = ServiceHomeMock()
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

    func test_viewDidLoad_should_configurator_view() throws {
        sut?.viewDidLoad()
        XCTAssertEqual(sut?.navigationItem.title, "Finance App")
        XCTAssertFalse(sut?.navigationController?.navigationBar.prefersLargeTitles ?? false, "vai quebrar pq não tem nenhuma NavigationController")
    }
    
    func test_viewDidLoad_should_configurator_view_with_navigation() throws {
        let sut = try XCTUnwrap(sut)
        _ = UINavigationController(rootViewController: sut)
        sut.viewDidLoad()
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }
    
    func test_viewDidLoad_should_call_service() {
        sut?.viewDidLoad()
        XCTAssertTrue(serviceSpy.fetchHomeDataCalled)
    }
    
}

class ServiceHomeMock: FinanceServiceInterface {
    
    private(set) var fetchHomeDataCalled = false
    func fetchHomeData(completion: @escaping ([String]) -> Void) {
        fetchHomeDataCalled = true
        completion([])
    }
}

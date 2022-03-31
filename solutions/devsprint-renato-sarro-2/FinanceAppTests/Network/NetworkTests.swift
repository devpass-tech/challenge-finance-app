//
//  NetworkTests.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 28/03/22.
//

import Foundation
import XCTest

@testable import FinanceApp

class NetworkTests: XCTestCase {
    
    let networkErrorStub = NetworkErrorStub()
    let networkSuccessStub = NetworkSuccessStub()
    lazy var sut: ApiClient? = nil
    
    func test_shouldReturnErrorInApiClient() {
        sut = ApiClient(urlSession: networkErrorStub)
        var result: Result<FakeDecodable, Error>?
        
        // 1 given
        sut?.fetchData(request: ApiRequestErrorMock()) {
            result = $0
        }
        
        // 3 then
        switch result {
        case .failure(let error):
            XCTAssert(error is ErrorDummy)
        default:
            XCTFail("Error not be nil")
        }
    }
    
    func test_shoulReturnSuccessInApiClient() {
        sut = ApiClient(urlSession: NetworkSuccessStub())
        var result: Result<HomeModel, Error>?
        
        sut?.fetchData(request: ApiRequestSuccessMock(), completion: {
            result = $0
        })
        
        switch result {
        case .success(let homeModel):
            XCTAssertNotNil(homeModel)
        default:
            XCTFail("request cant failure, should return home model")
        }
    }
    
    override func tearDown() {
        sut = nil
    }
}

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
    
    let networkStub = NetworkErrorStub()
    lazy var sut = ApiClient(urlSession: networkStub)
    
    func test_shouldReturnErrorInApiClient() {
        var result: Result<FakeDecodable, Error>?
        
        // 1 given
        sut.fetchData(request: ApiRequestMock()) {
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
}

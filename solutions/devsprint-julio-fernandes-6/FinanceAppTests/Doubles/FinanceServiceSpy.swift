//
//  FinanceServiceSpy.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 10/09/22.
//

import Foundation
@testable import FinanceApp

final class FinanceServiceSpy: FinanceServiceProtocol {
    
    private(set) var loadCalled = false
    private(set) var loadEndpointToBeValue: String = ""
    func load<T>(endpoint: FinanceEndpoint, callbackQueue: DispatchQueue, completion: @escaping (Result<T, FinanceServiceError>) -> Void) where T : Decodable {
        loadEndpointToBeValue = endpoint.rawValue
        loadCalled = true
        completion(.failure(.invalidData))
    }
    
    private(set) var cancelCalled = false
    func cancel() {
        cancelCalled = true
    }
}

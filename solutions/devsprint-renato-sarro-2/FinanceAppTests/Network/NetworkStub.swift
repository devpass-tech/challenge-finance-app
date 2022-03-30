//
//  NetworkStub.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 28/03/22.
//

import Foundation

@testable import FinanceApp

struct NetworkErrorStub: URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(nil, nil, ErrorDummy())
    }
}

struct ErrorDummy: Error {}

struct URLSessionDataTaskDummy {}

struct ApiRequestMock: ApiRequest {
    var urlString: String = "https://trinhngocthuyen.github.io/posts/tech/method-dispatch-in-swift/"
    var method: ApiMethod = .get
}

struct FakeDecodable: Decodable {}

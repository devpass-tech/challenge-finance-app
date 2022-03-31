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

struct NetworkSuccessStub: URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let data = json.data(using: .utf8)!
        let urlResponse = HTTPURLResponse(url: URL(string: ApiRequestSuccessMock().urlString)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        completionHandler(data, urlResponse, nil)
    }
}

struct ErrorDummy: Error {}
struct FakeDecodable: Decodable {}

struct ApiRequestErrorMock: ApiRequest {
    var urlString: String = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    var method: ApiMethod = .get
}

struct ApiRequestSuccessMock: ApiRequest {
    var urlString: String = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    var method: ApiMethod = .get
}

let json = """
{
    "balance": 15459.27,
    "savings": 1000.0,
    "spending": 500.0,
    "activity": [
        {
            "name": "Mall",
            "price": 100.0,
            "time": "8:57 AM"
        },
        {
            "name": "Food Court",
            "price": 100.0,
            "time": "8:57 AM"
        },
        {
            "name": "Oceanic Airlines",
            "price": 100.0,
            "time": "8:57 AM"
        },
        {
            "name": "Gym Membership",
            "price": 100.0,
            "time": "8:57 AM"
        },
        {
            "name": "Private Transport",
            "price": 100.0,
            "time": "8:57 AM"
        }
    ]
}
"""

//
//  Network.swift
//  FinanceApp
//
//  Created by Renato Sarro on 24/03/22.
//

import Foundation

enum ApiMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
    case put = "PUT"
}

protocol ApiRequest {
    var urlString: String { get }
    var method: ApiMethod { get }
}

enum ApiError: Error {
    case unknow
    case authorization
    case invalidData
    case parse
}

protocol ApiClientProtocol {
    func fetchData<T: Decodable>(request: ApiRequest, completion: @escaping (Result<T, Error>) -> Void)
}

protocol URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSessionProtocol {}

extension URLSession: URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: request, completionHandler: completionHandler)
        dataTask.resume()
    }
}

class ApiClient: ApiClientProtocol {
    
    private let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T: Decodable>(request: ApiRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: request.urlString) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        let dataTask = urlSession.fetchData(with: urlRequest) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...210).contains(response.statusCode) else {
                completion(.failure(ApiError.unknow))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let parseObject = try decoder.decode(T.self, from: data)
                
                completion(.success(parseObject))
            } catch {
                completion(.failure(ApiError.parse))
            }

        }
    }
}

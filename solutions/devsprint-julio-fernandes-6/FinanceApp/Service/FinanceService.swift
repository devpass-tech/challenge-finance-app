//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol {
    func load<T: Decodable>(endpoint: FinanceEndpoint, callbackQueue: DispatchQueue, completion: @escaping (Result<T, FinanceServiceError>) -> Void)
    func cancel()
}

final class FinanceService {
    
    private var session: URLSession
    private var dataTask: URLSessionDataTask?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func baseURL(_ endpoint: FinanceEndpoint) -> String {
        return "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/\(endpoint.rawValue).json"
    }
    
}

extension FinanceService: FinanceServiceProtocol {
    func load<T: Decodable>(endpoint: FinanceEndpoint, callbackQueue: DispatchQueue, completion: @escaping (Result<T, FinanceServiceError>) -> Void) {
        
        guard let url = URL(string: baseURL(endpoint)) else {
            callbackQueue.safeAsync { completion(.failure(FinanceServiceError.invalidURL)) }
            return
        }
        
        let request = URLRequest(url: url)

        dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                callbackQueue.safeAsync { completion(.failure(FinanceServiceError.invalidData)) }
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                callbackQueue.safeAsync { completion(.failure(FinanceServiceError.decode)) }
                return
            }
            
            callbackQueue.safeAsync { completion(.success(decodedData)) }
        }

        dataTask?.resume()
    }

    func cancel() {
        dataTask?.cancel()
    }
}

enum FinanceEndpoint: String {
    case home = "home_endpoint"
    case contactList = "contact_list_endpoint"
    case userProfile = "user_profile_endpoint"
}

enum FinanceServiceError: Error {
    case decode, invalidData, invalidURL
}

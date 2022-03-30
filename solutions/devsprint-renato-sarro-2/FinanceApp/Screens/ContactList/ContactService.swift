//
//  ContactService.swift
//  FinanceApp
//
//  Created by Renato Sarro on 24/03/22.
//

import Foundation

protocol ContactServiceProtocol {
    func getContacts(success: @escaping ([Contact]) -> Void, failure: @escaping (String) -> Void)
}

struct ContactRequest: ApiRequest {
    var urlString: String {
        return "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json"
    }
    
    var method: ApiMethod {
        return .get
    }
}

struct ContactService: ContactServiceProtocol {
    
    private let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getContacts(success: @escaping ([Contact]) -> Void, failure: @escaping (String) -> Void) {
        
        apiClient.fetchData(request: ContactRequest()) { (result: Result<[Contact], Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    success(response)
                }
            case .failure:
                DispatchQueue.main.async {
                    failure("Não foi possível receber a lista de contatos")
                }
            }
        }
        
    }
}

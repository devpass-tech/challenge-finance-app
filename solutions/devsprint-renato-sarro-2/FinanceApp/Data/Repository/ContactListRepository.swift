//
//  ContactListRepository.swift
//  FinanceApp
//
//  Created by Renato Sarro on 28/03/22.
//

import Foundation

struct ContactListRepository: ContactListRepositoryProtocol {
    
    private let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getContactList(completion: @escaping (Result<[Contact], Error>) -> Void) {
        apiClient.fetchData(request: ContactRequest(), completion: { (result: Result<[Contact], Error>) in
            DispatchQueue.main.async {
                completion(result)
            }
        })
    }
}

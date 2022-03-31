//
//  ContactListUseCase.swift
//  FinanceApp
//
//  Created by Renato Sarro on 28/03/22.
//

import Foundation

protocol ContactListUseCaseProtocol {
    func execute(success: @escaping ([Contact]) -> Void, failure: @escaping (Error) -> Void)
}

struct ContactListUseCase: ContactListUseCaseProtocol {
    private let repository: ContactListRepositoryProtocol
    
    init(repository: ContactListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(success: @escaping ([Contact]) -> Void, failure: @escaping (Error) -> Void) {
        repository.getContactList { result in
            
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure(error)
            }
            
        }
    }
}

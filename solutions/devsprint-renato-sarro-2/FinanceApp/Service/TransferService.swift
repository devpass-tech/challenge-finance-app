//
//  TransferService.swift
//  FinanceApp
//
//  Created by Cora on 25/03/22.
//

import Foundation

protocol TransferServiceProtocol {
    func fetchTransferData(success: @escaping () -> Void, failure: @escaping () -> Void)
}

struct TransferResponse: Decodable {
    var success: Bool
}

struct TransferRequest: ApiRequest {
    var urlString: String {
        return "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json"
    }
    
    var method: ApiMethod {
        return .get
    }
}

class TransferService: TransferServiceProtocol {
    
    private let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol = ApiClient()) {
        self.apiClient = apiClient
    }
     
    func fetchTransferData(success: @escaping () -> Void, failure: @escaping () -> Void) {
        apiClient.fetchData(request: TransferRequest()) { (result: Result<TransferResponse, Error>) in
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    if response.success {
                        success()
                    } else {
                        failure()
                    }
                }
            case .failure:
                DispatchQueue.main.async {
                    failure()
                }
            }
            
        }
    }
}

//
//  TransferService.swift
//  FinanceApp
//
//  Created by Cora on 25/03/22.
//

import Foundation

class TransferService {
    
    let transferURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json"
    
    func fetchTransferData(with string: String) {
        guard let url  = URL(string: transferURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error)
                return
            }
            if let data = data {
                do {
                    if try JSONDecoder().decode(TransferResult.self, from: data)  {
                        let result = TransferResult(success: data)
                        return
                    }
                } catch {
                    
                }
                
            }
        }
                
    }
}

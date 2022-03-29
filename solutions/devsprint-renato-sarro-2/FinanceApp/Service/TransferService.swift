//
//  TransferService.swift
//  FinanceApp
//
//  Created by Cora on 25/03/22.
//

import Foundation

protocol TransferServiceProtocol {
    func fetchTransferData()
}


class TransferService: TransferServiceProtocol {
    
    let transferURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json"
     
    func fetchTransferData() {
        guard let url  = URL(string: transferURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error)
                print("ERROR")
                return
            }
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(TransferResult.self, from: data)
                    print("RES: \(res)")
                } catch {
                }
            }
        }.resume()
    }
}

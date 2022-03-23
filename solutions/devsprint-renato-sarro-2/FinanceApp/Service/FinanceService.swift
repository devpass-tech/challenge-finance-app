//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

class FinanceService {
    var network = URLSessionManager()

    func fetchHomeData(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: Path.homeAPI) else { return }
        
        network.fetch(with: url) { data, response, error in
            if let data = data, let homeData = try? JSONDecoder().decode(HomeModel.self, from: data) {
                DispatchQueue.main.async {
                    completion(homeData.activity.map{$0.name})
                }
            } else {
                print(error?.localizedDescription ?? "Erro")
            }
        }
    }
    
    func transferAmount(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Path.transferResultAPI) else { return }
        
        network.fetch(with: url) { data, response, error in
            if let data = data, let transferResult = try? JSONDecoder().decode(TransferResult.self, from: data) {
                DispatchQueue.main.async {
                    completion(transferResult.success)
                }
            } else {
                print(error?.localizedDescription ?? "Erro")
            }
        }
    }
}

//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

class FinanceService {

    func fetchHomeData(completion: @escaping (HomeModel) -> Void) {

        guard let url = URL(string: FinanceService.homeAPIPAth) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let homeData = try? JSONDecoder().decode(HomeModel.self, from: data) {
                DispatchQueue.main.async {
                    completion(homeData)
                }
            } else {
                print(error?.localizedDescription ?? "Erro")
            }
        }
        
        task.resume()
    }
}

extension FinanceService {
    
    static let homeAPIPAth = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    
}

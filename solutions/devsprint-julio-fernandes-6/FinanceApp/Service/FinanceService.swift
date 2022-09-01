//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

class FinanceService {
    
    func fetchHomeData(completion: @escaping ([String]) -> Void) {
        
        guard let url = FinanceService.homeApiPath else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let homeData = try JSONDecoder().decode(HomeModel.self, from: data)
                completion(homeData.activity.map({$0.name}))
            } catch {
                print(error.localizedDescription)
            }
            
            
        }.resume()
    }
}

extension FinanceService {
    
    static let homeApiPath = URL(string:"https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")
    
    
}

//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

class FinanceService {
    
    func fetchHomeData(completion: @escaping ([String]) -> Void) {
        
        let urlString = "\(StringsRequest.baseURL.localized())\(StringsRequest.endPointHomeModel.localized())"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let resultHomeModel = try JSONDecoder().decode(HomeModel.self, from: data)
                let activityString :[String] = resultHomeModel.activity.map({
                    return $0.name
                })
                completion(activityString)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

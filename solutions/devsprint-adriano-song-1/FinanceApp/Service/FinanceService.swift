//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

class FinanceService {

    func fetchHomeData(completion: @escaping ([String]) -> Void) {

        completion(["Mall", "Food Court", "Oceanic Airlines", "Gym Membership", "Private Transport"])
    }
}

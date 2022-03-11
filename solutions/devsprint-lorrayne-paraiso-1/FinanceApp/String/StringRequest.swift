//
//  StringRequest.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 10/03/22.
//

import Foundation

enum StringsRequest: String {
    
    case baseURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/"
    case endPointHomeModel = "api/home_endpoint.json"
    
    func localized() -> String { rawValue }
}

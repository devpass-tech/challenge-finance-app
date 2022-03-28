//
//  ContactRequest.swift
//  FinanceApp
//
//  Created by Renato Sarro on 24/03/22.
//

import Foundation

struct ContactRequest: ApiRequest {
    var urlString: String {
        return "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json"
    }
    
    var method: ApiMethod {
        return .get
    }
}

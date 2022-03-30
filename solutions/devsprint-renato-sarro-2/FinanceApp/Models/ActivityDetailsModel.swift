//
//  ActivityDetailsModel.swift
//  FinanceApp
//
//  Created by Gilmar Junior on 29/03/22.
//

import Foundation

struct ActivityDetailsModel: Decodable {
    
    let name: String
    let category: String
    let price: Double
    let time: String
    
}

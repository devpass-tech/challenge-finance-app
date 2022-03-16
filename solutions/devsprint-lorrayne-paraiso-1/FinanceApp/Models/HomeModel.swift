//
//  HomeModel.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 04/02/22.
//

import Foundation

struct HomeModel: Decodable {
    
    let activity: [Activity]
}

struct Activity: Decodable {

    let name: String
    let price: Float
    let time: String
}

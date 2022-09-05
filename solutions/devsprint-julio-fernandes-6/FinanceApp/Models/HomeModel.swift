//
//  HomeModel.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 04/02/22.
//

import Foundation

struct HomeModel: Decodable {
    let balance: Float
    let savings: Float
    let spending: Float
    var activity: [Activity]
}

struct Activity: Decodable {
    let name: String
    let price: Float
    let time: String
}

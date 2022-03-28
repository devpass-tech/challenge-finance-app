//
//  HomeModel.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 04/02/22.
//

import Foundation

struct HomeModel: Decodable {
    let balance: Double
    let savings: Double
    let spending: Double
    let activity: [Activity]
}

struct Activity: Decodable {
    let name: String
    let price: Double
    let time: String
}

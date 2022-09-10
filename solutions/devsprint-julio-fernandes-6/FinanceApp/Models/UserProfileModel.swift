//
//  UserProfileModel.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/09/22.
//

import Foundation

struct UserProfileModel: Decodable {
    let name: String
    let phone: String
    let email: String
    let address: String
    var account: UserProfileAccount
}

struct UserProfileAccount: Decodable {
    let agency: String
    let account: String
}

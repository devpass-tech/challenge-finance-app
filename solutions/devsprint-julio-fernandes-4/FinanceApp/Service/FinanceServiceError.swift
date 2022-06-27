//
//  FinanceError.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 24/06/22.
//

import Foundation

enum FinanceServiceError: Error {
    case invalidURL
    case errorGeneric(description: String)
    case invalidResponse
    case invalidData
    case errorDecoder
}

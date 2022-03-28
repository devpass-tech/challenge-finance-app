//
//  ContactListRepositoryProtocol.swift
//  FinanceApp
//
//  Created by Renato Sarro on 28/03/22.
//

import Foundation

protocol ContactListRepositoryProtocol {
    func getContactList(completion: @escaping (Result<[Contact], Error>) -> Void)
}

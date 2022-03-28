//
//  ContactListFactory.swift
//  FinanceApp
//
//  Created by Renato Sarro on 24/03/22.
//

import UIKit

struct ContactListFactory {
    static func build() -> UIViewController {
        let apiClient = ApiClient()
        let repository = ContactListRepository(apiClient: apiClient)
        let useCase = ContactListUseCase(repository: repository)
        let controller = ContactListViewController(useCase: useCase)
        
        return controller
    }
}

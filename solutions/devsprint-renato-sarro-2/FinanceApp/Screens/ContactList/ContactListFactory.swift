//
//  ContactListFactory.swift
//  FinanceApp
//
//  Created by Renato Sarro on 24/03/22.
//

import UIKit

struct ContactListFactory {
    static func build() -> UIViewController {
        let controller = ContactListViewController(service: ContactService(apiClient: ApiClient()))
        return controller
    }
}

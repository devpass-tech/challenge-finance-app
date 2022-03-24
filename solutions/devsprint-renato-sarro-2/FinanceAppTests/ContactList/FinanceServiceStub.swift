//
//  FinanceServiceStub.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 24/03/22.
//

import Foundation

@testable import FinanceApp

struct FinanceServiceStub: FinanceServiceProtocol {
    func fetchContactList(completion: @escaping ([Contact]) -> Void) {
        completion([Contact(name: "Renato", phone: "+55 (11) 99999-9999"),
                    Contact(name: "Ronald Robertson", phone: "+55 (11) 99999-9999")])
    }
}

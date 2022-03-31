//
//  FinanceServiceStub.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 24/03/22.
//

import Foundation

@testable import FinanceApp

struct ContactUseCaseStub: ContactListUseCaseProtocol {
    func execute(success: @escaping ([Contact]) -> Void, failure: @escaping (Error) -> Void) {
        success([Contact(name: "Renato", phone: "+55 (11) 99999-9999"),
                    Contact(name: "Ronald Robertson", phone: "+55 (11) 99999-9999")])
    }
}

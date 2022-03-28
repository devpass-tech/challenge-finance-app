//
//  ContactListSpy.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 23/03/22.
//

import Foundation

@testable import FinanceApp

class ContactListSpy: ContactListViewProtocol {
    var list: [Contact] = []
    
    func updateList(with list: [Contact]) {
        self.list = list
    }
}

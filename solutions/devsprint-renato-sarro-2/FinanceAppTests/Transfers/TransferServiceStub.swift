//
//  TransferServiceStub.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 29/03/22.
//

import Foundation

@testable import FinanceApp

struct TransferServiceStub: TransferServiceProtocol {
    
    let isSuccess: Bool
    
    func fetchTransferData(success: @escaping () -> Void, failure: @escaping () -> Void) {
      
        isSuccess ? success() : failure()
        
    }
}

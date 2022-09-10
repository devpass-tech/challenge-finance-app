//
//  DispatchQueue+Extensions.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/09/22.
//

import UIKit

public extension DispatchQueue {
    
    func safeAsync(_ block: @escaping () -> Void ) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async { block() }
        }
    }
    
}

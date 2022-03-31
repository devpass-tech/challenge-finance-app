//
//  TransferFactory.swift
//  FinanceApp
//
//  Created by Renato Sarro on 31/03/22.
//

import UIKit

struct TransferFactory {
    static func build() -> UIViewController {
        
        let controller = TransfersViewController(service: TransferService())
        let coordinator = TransferCoordinator()
        
        coordinator.mainViewController = controller
        controller.coordinator = coordinator
        
        return controller
        
    }
}

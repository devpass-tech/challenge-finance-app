//
//  TransferCoordinator.swift
//  FinanceApp
//
//  Created by Renato Sarro on 31/03/22.
//

import UIKit

enum TransferActions {
    case success
}

protocol TransferCoordinatorProtocol {
    func executeFlow(to action: TransferActions)
}

class TransferCoordinator: TransferCoordinatorProtocol {
    
    weak var mainViewController: UIViewController?
    
    func executeFlow(to action: TransferActions) {
        switch action {
        case .success:
            mainViewController?.navigationController?.present(ConfirmationViewController(), animated: true)
        }
    }
}

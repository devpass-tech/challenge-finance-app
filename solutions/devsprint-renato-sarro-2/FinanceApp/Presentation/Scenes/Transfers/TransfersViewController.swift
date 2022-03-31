//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol TransferViewControllerProtocol: AnyObject {
    func chamaFeFe()
}

class TransfersViewController: UIViewController, TransferViewControllerProtocol {

    var coordinator: TransferCoordinatorProtocol?
    
    private var transferView: TransferViewProtocol
    private let service: TransferServiceProtocol
    
    init(service: TransferServiceProtocol, transferView: TransferViewProtocol = TransfersView()) {
        self.transferView = transferView
        self.service = service
        
        super.init(nibName: nil, bundle: nil)
        
        self.transferView.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = transferView as? UIView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func chamaFeFe() {
        service.fetchTransferData { [transferView, coordinator] in
            transferView.configInitalState()
            coordinator?.executeFlow(to: .success)
        } failure: {
            self.transferView.showError(message: "Não foi possível realizar a transferência")
        }

    }
}

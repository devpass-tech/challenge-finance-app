//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol TransferViewControllerProtocol {
    func chamaFeFe()
}

class TransfersViewController: UIViewController, TransferViewControllerProtocol {

    lazy var transferView: TransferViewProtocol = {
        return TransfersView()
    }()
    
    private let service: TransferServiceProtocol
    
    init(service: TransferServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = TransfersView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func chamaFeFe() {
        service.fetchTransferData()
    }
}

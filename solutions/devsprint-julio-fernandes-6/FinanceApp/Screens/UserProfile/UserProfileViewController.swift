//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileViewController: UIViewController {
    
    // deixamos como "var" e sem ser private para que possamos nos testes injetar um Mock
    var service: FinanceServiceProtocol = FinanceService()

    private lazy var userProfileView: UserProfileView = {
        let view = UserProfileView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func loadView() {
        self.view = userProfileView
    }
    
    private func fetchData() {
        service.load(endpoint: .userProfile, callbackQueue: .main) { [weak self] (response: Result<UserProfileModel, FinanceServiceError>) in
            switch response {
            case let .success(dto): self?.userProfileView.render(.buildPersonalData(dto))
            case .failure: break
            }
        }
    }
    
}


//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class HomeViewController: UIViewController {

    // deixamos como "var" e sem ser private para que possamos nos testes injetar um Mock
    var service: FinanceServiceProtocol = FinanceService()
    
    private lazy var barButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(profileDidClick))
        return barButton
    }()
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView(delegate: self)
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(barButton, animated: false)
        fetchData()
    }

    override func loadView() {
        self.view = homeView
    }
    
    private func fetchData() {
        service.load(endpoint: .home, callbackQueue: .main) { [weak self] (response: Result<HomeModel, FinanceServiceError>) in
            switch response {
            case let .success(dto):
                self?.homeView.render(.buildHeader(dto))
                self?.homeView.render(.buildActivityList(dto.activity))
            case .failure: break
            }
        }
    }
}

// MARK: Actions && ActivityListViewDelegate
extension HomeViewController: ActivityListViewDelegate {
    
    func didSelectedActivity(_ activity: Activity) {
        let controller = ActivityDetailsViewController()
        controller.activity = activity
        show(controller, sender: self)
    }
    
    @objc func profileDidClick() {
        let controller = UserProfileViewController()
        showDetailViewController(controller, sender: self)
    }
    
}



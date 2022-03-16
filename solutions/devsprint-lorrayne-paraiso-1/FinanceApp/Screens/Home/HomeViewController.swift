//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service: FinanceService
    private let thread: DispatchQueue

    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()
    
    init(service: FinanceService = FinanceService(), thread: DispatchQueue = .main) {
        self.service = service
        self.thread = thread
           
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    override func viewDidLoad() {

        navigationItem.title = "Finance App"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        service.fetchHomeData { homeData in

            guard let homeData = homeData else {
                return
            }

            let configuration = HomeViewConfiguration(homeData: homeData)

            self.thread.async {
                self.homeView.updateView(with: configuration)
            }
        }
    }

    override func loadView() {
        self.view = homeView
    }
}

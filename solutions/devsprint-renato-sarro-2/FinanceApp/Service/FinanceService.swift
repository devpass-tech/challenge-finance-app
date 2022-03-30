//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol {
    func fetchContactList(completion: @escaping ([Contact]) -> Void)
}

class FinanceService: FinanceServiceProtocol {
    
    private let thread: DispatchQueue
    
    init(thread: DispatchQueue = .main) {
        self.thread = thread
    }

    func fetchHomeData(completion: @escaping ([String]) -> Void) {

        guard let url = URL(string: FinanceService.homeAPIPAth) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let homeData = try? JSONDecoder().decode(HomeModel.self, from: data) {
                DispatchQueue.main.async {
                    completion(homeData.activity.map{$0.name})
                }
            } else {
                print(error?.localizedDescription ?? "Erro")
            }
        }
        
        task.resume()
    }
    
<<<<<<< HEAD
    func fetchActivityDetails(completion: @escaping (ActivityDetailsModel) -> Void) {

        guard let url = URL(string: FinanceService.activityDetailsAPIPath) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let activityDetailsData = try? JSONDecoder().decode(ActivityDetailsModel.self, from: data) {
                DispatchQueue.main.async {
                    completion(activityDetailsData)
=======
    func fetchContactList(completion: @escaping ([Contact]) -> Void) {
        thread.async {
            completion([Contact(name: "Ronald Robertson", phone: "+55 (11) 99999-9999"),
                        Contact(name: "Ronald Robertson", phone: "+55 (11) 99999-9999")])
        }
    }
  
    func transferAmount(completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: FinanceService.transferResultAPIPath) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let transferResult = try? JSONDecoder().decode(TransferResult.self, from: data) {
                DispatchQueue.main.async {
                    completion(transferResult.success)
>>>>>>> ce4ceb2dc1c002ab0c88f89ffd8b1a54f54dbed9
                }
            } else {
                print(error?.localizedDescription ?? "Erro")
            }
        }
        
        task.resume()
<<<<<<< HEAD
    }
=======
        
    }
    
>>>>>>> ce4ceb2dc1c002ab0c88f89ffd8b1a54f54dbed9
}

extension FinanceService {
    
    static let homeAPIPAth = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    static let transferResultAPIPath = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json"
    
    static let activityDetailsAPIPath = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json"
    
}

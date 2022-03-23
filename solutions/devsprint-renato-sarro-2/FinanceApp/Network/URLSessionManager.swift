//
//  URLSessionManager.swift
//  FinanceApp
//
//  Created by Henrique Augusto on 23/03/22.
//

import UIKit

protocol URLSessionManagerPrococol {
    func fetch(with urlPath: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class URLSessionManager: URLSessionManagerPrococol {
    func fetch(with urlPath: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: urlPath) { data, response, error in
                completion(data, response, error)
        }
        task.resume()
    }
}

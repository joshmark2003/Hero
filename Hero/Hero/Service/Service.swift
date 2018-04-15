//
//  Service.swift
//  Hero
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation
import UIKit

enum RequestError: Swift.Error {
    case invalidURL
    case unknown
}

protocol ServiceProtocol {
    func getItems(completionHandler: @escaping ([Item]?, RequestError?) -> Void)
}

struct Service: ServiceProtocol {
    
    static let shared = Service()
    private let session: URLSession
    
    var baseURL = "https://www.datakick.org/api/items"
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getItems(completionHandler: @escaping ([Item]?, RequestError?) -> Void) {
        showActivityIndicator(show: true)
        guard let url = URL(string: baseURL) else {
            DispatchQueue.main.async {
                self.showActivityIndicator(show: false)
                return completionHandler(nil, RequestError.invalidURL)
            }
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showActivityIndicator(show: false)
                    completionHandler(nil, RequestError.unknown)
                    //We could use this mapper to display error
                    //At the moment we are not sure what the errors are
                }
                return
            }
            
            let items = try? JSONDecoder().decode([Item].self, from: data)
            
            DispatchQueue.main.async {
                self.showActivityIndicator(show: false)
                completionHandler(items, nil)
            }
        }
        
        task.resume()
    }
    
    private func showActivityIndicator(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}

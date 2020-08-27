//
//  Authentification.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 24.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

final class BlizzardLoginService: LoginProtocol {
    private enum Constants {
        static let basicAuth = "NWYzOTYwZDBkOGQyNGQ3NDkzZmNkNjhhZmEyODhjNjA6ajgxeWxERFhkczNqQ2QxN3RkVGMySTVxemVYVEh3TlY"
        static let authHeader = "Authorization"
        static let contentTypeHeader = "Content-Type"
        static let url = "https://us.battle.net/oauth/token"
        static let urlEncoded = "application/x-www-form-urlencoded"
        static let httpMethod = "POST"
        static let parameters = "grant_type=client_credentials"
    }
    
    func login(completion: @escaping (AuthJSON?, AuthStatus) -> ()) {
        let parameters = Constants.parameters
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: Constants.url)!,timeoutInterval: Double.infinity)
        request.addValue("Basic \(Constants.basicAuth)=", forHTTPHeaderField: Constants.authHeader)
        request.addValue(Constants.urlEncoded, forHTTPHeaderField: Constants.contentTypeHeader)
        
        request.httpMethod = Constants.httpMethod
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data else {
                    return completion(nil, .failure)
                }
                let decoder = JSONDecoder()
                let jsonParsed = try decoder.decode(AuthJSON.self, from: data)
                completion(jsonParsed, .success)
            } catch _ as NSError {
                completion(nil, .failure)
            }
        }
        task.resume()
    }
}

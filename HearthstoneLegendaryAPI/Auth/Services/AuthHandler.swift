//
//  AuthHandler.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 24.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

final class AuthHandler {
    let loginService: LoginProtocol?
    
    init(with loginService: LoginProtocol) {
        self.loginService = loginService
    }
    
    func auth(completion: @escaping (Result<AuthJSON?, AuthError>) -> ()) {
        loginService?.login { result in
            completion(result)
        }
    }
}

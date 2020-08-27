//
//  AuthScreenInteractor.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 24.08.2020.
//  Copyright (c) 2020 18579118. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class AuthScreenInteractor {
    // - heroes: array of all classes in the game ( no reason to download it )
    // - store: security placeholder for acess_token that blizzard gives
    
    internal let heroes: [Hero] = [.demonHunter, .druid, .hunter, .mage, .paladin, .priest, .rogue, .shaman, .warrior, .warlock]
    private var store: Storable
    
    init(store: Storable = CredentialsManager()) {
        self.store = store
    }
}

// MARK: - Extensions -

extension AuthScreenInteractor: AuthScreenInteractorInterface {
    func auth(completion: @escaping (AuthJSON?, AuthStatus) -> ()) {
        let loginService = BlizzardLoginService()
        let authHandler = AuthHandler(with: loginService)
        authHandler.auth { authStruct, status in
            DispatchQueue.main.async {
                switch status {
                case .success:
                    // if everything is fine -> save the data in keychain ( store )
                    guard let token = authStruct?.access_token else { return }
                    self.store.key = token
                default:
                    break
                }
                completion(authStruct, status)
            }
        }
    }
}

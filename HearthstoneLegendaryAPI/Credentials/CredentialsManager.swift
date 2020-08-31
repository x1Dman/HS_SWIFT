//
//  Credentials.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 26.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit
import Security

/*
 CredentialsManager:
 uses keychain, has get and set on property called key
 */

final class CredentialsManager: Storable {
    
    var key: String? {
        get {
            // here we want to get the key
            let service = AuthJSON.service
            let account = AuthJSON.account
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: account,
                kSecReturnData as String: true
            ]
            
            var item: CFTypeRef?
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            
            switch status {
            case errSecSuccess:
                guard let existingItem = item as? Data,
                    let token = String(data: existingItem, encoding: .utf8)
                else {
                    return nil
                }
                print("WOW! it's token -> \(token)")
                return token
            default:
                return nil
            }
        }
        set {
            var copyResult: CFTypeRef? = nil
            let account = AuthJSON.account
            let service = AuthJSON.service
            // try to get a correct passwords
            guard let value = newValue, let password = value.data(using: .utf8) else { return }
            // query for adding
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: account,
                kSecValueData as String: password
            ]
            // query for checking that there is already key in keychain
            let searchQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: account,
                kSecReturnData as String: true
            ]
            
            let status = SecItemCopyMatching(searchQuery as CFDictionary, &copyResult)
            switch status {
                // TODO: check for outdated tokens
                // means that there is already data
            case errSecSuccess:
                guard let oldData = copyResult as? Data else { return }
                let oldPassword = String(data: oldData, encoding: .utf8)
                // comparing old token and new one
                if oldPassword != value {
                    // update old key
                    let _ = SecItemUpdate(
                        [
                            kSecClass as String: kSecClassGenericPassword,
                            kSecAttrService: service,
                            kSecAttrAccount: account
                        ] as CFDictionary,
                        [
                            kSecValueData as String: password
                        ] as CFDictionary
                    )
                }
            case errSecItemNotFound:
                // there is not such data -> adding
                SecItemAdd(query as CFDictionary, nil)
            default:
                print("New value: \(String(describing: String(data: password, encoding: .utf8)))")
            }
        }
    }
}

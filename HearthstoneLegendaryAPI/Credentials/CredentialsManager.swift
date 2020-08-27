//
//  Credentials.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 26.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit
import Security

final class CredentialsManager: Storable {
    
    private var _key: String = ""
    
    var key: String? {
        get {
            // _key
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
                return token
            default:
                return nil
            }
        }
        set {
            guard let value = newValue else { return }
            _key = value
            let account = AuthJSON.account
            let service = AuthJSON.service
            guard let password = _key.data(using: .utf8) else {
                return
            }
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: account,
                kSecValueData as String: password
            ]

            let status = SecItemAdd(query as CFDictionary, nil)
        }
    }
}

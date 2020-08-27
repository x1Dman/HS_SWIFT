//
//  AuthJSON.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 24.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

enum AuthStatus: Error {
    case success
    case failure
}

enum AuthError: Error {
    case noSecret
    case unexpectedSecretData
    case unhandledError(status: OSStatus)
}

struct AuthJSON: Decodable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    static let service = "secret"
    static let account = "HS_SWIFT"
    static let siteApi = "https://us.api.blizzard.com/hearthstone/cards?locale=en_US"
}

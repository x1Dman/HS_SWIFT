//
//  APIRequestBuilder.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 27.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

final class APIRequestBuilder: URLBuildProtocol {
    private var store: Storable
    
    init(with store: Storable = CredentialsManager()) {
        self.store = store
    }
    
    func buildRequest(with className: String) -> String {
        let site = AuthJSON.siteApi
        guard let token = store.key else {
            return ""
        }
        // locale is already setted
        let urlString = "\(site)&class=\(className)&gameMode=constructed&pageSize=999&access_token=\(token)"
        print(urlString)
        return urlString
    }
}

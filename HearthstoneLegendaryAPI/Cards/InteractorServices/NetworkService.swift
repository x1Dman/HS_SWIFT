//
//  NetworkService.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 30.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

class NetworkService {
    
    private let blizzardUrl = "https://us.api.blizzard.com/hearthstone/cards?locale=en_US&gameMode=constructed&minionType=murloc&access_token=" + Secret.blizzToken
    
    enum JSONError: String, Error {
        case none = "OK"
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }

    func jsonParser(completionHandler: @escaping (_ cards: Cards?, _ error: JSONError) -> ()) {
        // hit the API endpoint
        let request = NSMutableURLRequest(url: NSURL(string: blizzardUrl)! as URL,
            cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            do {
                guard let data = data else {
                    return completionHandler(nil, .NoData)
                }
                let decoder = JSONDecoder()
                let jsonParsed = try decoder.decode(Cards.self, from: data)
                completionHandler(jsonParsed, .none)
            } catch _ as NSError {
                completionHandler(nil, .ConversionFailed)
            }
        }.resume()
    }
}

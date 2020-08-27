//
//  NetworkService.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 30.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

/*
 Service for downloading a json from blizzard REST API server
 Secret key for auth holds in Secret.swift
*/

// just description
//enum JSONError: String, Error {
//    case none = "OK"
//    case NoData = "ERROR: no data"
//    case ConversionFailed = "ERROR: conversion from JSON failed"
//}

class NetworkService: JSONParseable {
    
    private struct Constants {
        static let httpMethod = "GET"
    }

    func jsonParser(urlString: String, completionHandler: @escaping (_ cards: Cards?, _ error: JSONError) -> ()) {
        // hit the API endpoint
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
            cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0)
        request.httpMethod = Constants.httpMethod
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            do {
                guard let data = data else {
                    print("NO DATA!")
                    return completionHandler(nil, .NoData)
                }
                print(data)
                let decoder = JSONDecoder()
                let jsonParsed = try decoder.decode(Cards.self, from: data)
                completionHandler(jsonParsed, .none)
            } catch {
                print("ConversationFailed")
                completionHandler(nil, .ConversionFailed)
            }
        }.resume()
    }
}

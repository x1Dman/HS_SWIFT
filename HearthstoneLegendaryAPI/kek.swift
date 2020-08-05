////
////  kek.swift
////  HearthstoneLegendaryAPI
////
////  Created by 18579118 on 30.07.2020.
////  Copyright © 2020 18579118. All rights reserved.
////
//
//import Foundation
//
//class Network {
//
//    func fetchData(url: URL, completion: @escaping ([[String:Any]])->() ) {
//        var parsedData = [[String:Any]]()
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            
//            guard let data = data else { return }
//            
//            let parser = JSONParser()
//            parsedData = parser.parse(data)
//            DispatchQueue.main.async {
//                completion(parsedData)
//            }
//        }
//        task.resume()
//    }
//}

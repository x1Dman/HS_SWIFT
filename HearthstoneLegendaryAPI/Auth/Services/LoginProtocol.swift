//
//  LoginProtocol.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 24.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

protocol LoginProtocol  {
    func login(completion: @escaping (Result<AuthJSON?, AuthError>) -> ())
}

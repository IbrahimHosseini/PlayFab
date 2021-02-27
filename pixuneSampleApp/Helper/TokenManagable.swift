//
//  TokenManagable.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

protocol TokenManageable {
    var token: String { get }    
    func setToken(token: String)
}


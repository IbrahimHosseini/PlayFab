//
//  DataManager.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

class DataManager: NSObject, TokenManageable {
    
    //MARK: - Singletone
    static let shared = DataManager()
    
    //MARK: - Saved data
    @Storage(key: "token", defaultValue: "")
    var token: String
    
    func setToken(token: String) {
        self.token = token
    }

}

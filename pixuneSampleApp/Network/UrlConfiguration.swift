//
//  ConfigurationAddress.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

class UrlConfiguration {
    static let shared = UrlConfiguration()
    
    var scheme : String
    var host: String
    
    init() {
        if let dictionary = Bundle.main.infoDictionary,
           let configuration = dictionary["Configuration"] as? String {
            let path = Bundle.main.path(forResource: "Configuration", ofType: "plist")
            let config = NSDictionary(contentsOfFile: path!)
            for (key, value) in config! {
                if let key = key as? String,
                   let value = value as? [String: String] {
                    if key == configuration {
                        scheme  = value["scheme"] ?? ""
                        host  = value["host"] ?? ""
                        return
                    }
                }
            }
        }
        fatalError("Error: Configuration file doesn't exist in project directory, please include it to be able to use this class")
    }
}



//
//  EndPoint.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

struct EndPoint {
    var path: String
    var basePath: String
    var queryItems: [String: Any] = [:]
}

extension EndPoint {
    static let client = "/client/"
    static let server = "/server/"
    
    var url: URL {
        var components = URLComponents()
        components.scheme = UrlConfiguration.shared.scheme
        components.host = UrlConfiguration.shared.host
        components.path = basePath + path
        
        var queryParameterItems: [URLQueryItem] = []
        
        queryItems.forEach { (item: (key: AnyHashable, value: Any)) in
            if item.value is [UInt64] {
                (item.value as! [UInt64]).forEach({ (int) in
                    queryParameterItems.append(URLQueryItem(name: "\(item.key)" + "[]", value: "\(int)"))
                })
            } else {
                queryParameterItems.append(URLQueryItem(name: "\(item.key)", value: "\(item.value)"))
            }
        }
        
        components.queryItems?.forEach({ (item) in
            queryParameterItems.append(item)
        })
        
        if queryParameterItems != [] {
            components.queryItems = queryParameterItems
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "X-SecretKey": Constants.secretKey
        ]
    }
}

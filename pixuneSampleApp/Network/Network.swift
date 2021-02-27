//
//  Network.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation
import Combine

// MARK: - Network Controller
protocol NetworkControllerProtocol: class {
    typealias Headers = [String: Any]
    
    func post<T>(type: T.Type,
                 url: URL,
                 body: [String: Any]?,
                 headers: Headers) -> AnyPublisher<T, Error> where T: Decodable
    
}

final class NetworkController: NetworkControllerProtocol {
    
    //MARK: Post generic API
    func post<T>(type: T.Type, url: URL, body: [String: Any]? = nil, headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {
        var urlRequest = URLRequest(url: url)
        
        do {
            if let parameters = body {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        urlRequest.httpMethod = HttpMethod.POST.rawValue
        
        headers.forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


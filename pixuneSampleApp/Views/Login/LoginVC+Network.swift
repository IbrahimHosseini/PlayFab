//
//  LoginVC+Network.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation
import Combine

extension EndPoint {
    static private let login = "LoginWithPlayFab"
    
    static func login(username: String, password: String, titleId: String) -> Self {
        return EndPoint(path: login,
                        basePath: client)
    }
}

//MARK: - Logic Controller
protocol LoginServiceProtocol: ServiceProtocol {
    func login(username: String, password: String, titleId: String) -> AnyPublisher<LoginBaseModel, Error>
}

final class LoginService: LoginServiceProtocol {
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func login(username: String, password: String, titleId: String) -> AnyPublisher<LoginBaseModel, Error> {
        let endpoint = EndPoint.login(username: username, password: password, titleId: titleId)
        
        let body: [String: Any] = ["Username": username,
                                   "Password": password,
                                   "TitleId": titleId]
        
        return networkController.post(type: LoginBaseModel.self,
                                      url: endpoint.url,
                                      body: body,
                                      headers: endpoint.headers)
    }
}

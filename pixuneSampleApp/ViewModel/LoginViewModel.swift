//
//  LoginViewModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation
import Combine

class LoginViewModel {
    let login = PassthroughSubject<(Bool, String), Never>()
    
    var loginService: LoginServiceProtocol
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        let network = NetworkController()
        loginService = LoginService(networkController: network)
    }
    
    func login(username: String, password: String, titleId: String) {
        loginService.login(username: username, password: password, titleId: titleId)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished login")
                }
            } receiveValue: { [weak self] (completion) in
                guard let self = self else { return }
                
                guard let data = completion.data, let entityToken = data.entityToken, let token = entityToken.entityToken else {
                    self.login.send((false, completion.status ?? "Username not found or not verified"))
                    return
                }
                DataManager.shared.setToken(token: token)
                self.login.send((true, ""))
            }
            .store(in: &subscribers)
    }
}


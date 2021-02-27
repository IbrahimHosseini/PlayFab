//
//  LoginVC.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import UIKit
import Combine

class LoginVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    private var viewModel = LoginViewModel()
    private var subscribers = Set<AnyCancellable>()
    private var isLogin: Bool = false
    
    //MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Functions
    fileprivate func setupView() {
        title = "Play Fab"
        isLogin = DataManager.shared.token.isEmpty ? false : true
        self.actionButton.setTitle(self.isLogin ? "Show LeaderBoard" : "Login", for: .normal)
        
        indicator.color = .systemTeal
        indicator.hidesWhenStopped = true
        indicator.style = .large
    }
    
    fileprivate func setupBinding() {
        viewModel.login
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] (status, error) in
                guard let self = self else { return }
                if status {
                    self.setupView()
                    self.indicator.stopAnimating()
                } else {
                    print(error)
                }
                self.actionButton.isEnabled = true
            })
            .store(in: &subscribers)
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        if isLogin {
            let vc = UIStoryboard.main.instantiate(viewController: LeaderBoardVC.self)
            if let navigation = self.navigationController {
                navigation.pushViewController(vc, animated: true)
            }
        } else {
            actionButton.isEnabled = false
            indicator.startAnimating()

            let username = "userTesti"
            let password = "Salam@99@Test"
            let titleId = "3766A"

            viewModel.login(username: username,
                            password: password,
                            titleId: titleId)
        }
        
        
    }
    
}

//
//  LoginSceneViewController.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import UIKit

protocol LoginSceneViewControllerProtocol: AnyObject {
    func showLogingSuccess(fullUserName: String)
    func showLogingFailure(message: String)
}

class LoginSceneViewController: UIViewController {
    var interactor: LoginSceneInteractorProtocol?
    var router: LoginSceneRoutingProtocol?
    
    private var loginButton: UIButton = {
        let btn = UIButton(frame: CGRect.zero)
        btn.setTitle("Login".uppercased(), for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setupButton()
    }
}

extension LoginSceneViewController {
    
    private func setupButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])


        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc func loginButtonAction() {
        interactor?.tryToLogIn()
    }
}

extension LoginSceneViewController: LoginSceneViewControllerProtocol {
    func showLogingSuccess(fullUserName: String) {
        router?.showLoginSuccess()
    }
    
    func showLogingFailure(message: String) {
        router?.showLogingFailure(message: message)
    }
}

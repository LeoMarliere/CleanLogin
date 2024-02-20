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

    @IBOutlet private var loginButton: UIButton!
    
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

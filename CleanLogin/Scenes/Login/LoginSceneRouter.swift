//
//  LoginSceneRouter.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import UIKit

protocol LoginSceneRoutingProtocol {
    func showLoginSuccess()
    func showLogingFailure(message: String)
}

final class LoginSceneRouter {
    
    weak var source: UIViewController?
    private let sceneFactory: LoginSceneFactoryProtocol
    
    init(sceneFactory: LoginSceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
}

extension LoginSceneRouter: LoginSceneRoutingProtocol {
    func showLogingFailure(message: String) {
        let action = UIAlertAction(title: "OK", style: .destructive)
        let alertController = UIAlertController(title: "Login Failure",message: message,preferredStyle: .alert)
        alertController.addAction(action)
        source?.present(alertController, animated: true)
    }
    
    func showLoginSuccess() {
        let scene = sceneFactory.makeLoginScene()
        source?.navigationController?.pushViewController(scene, animated: true)
    }
}

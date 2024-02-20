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
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension LoginSceneRouter: LoginSceneRoutingProtocol {
    func showLogingFailure(message: String) {
        source?.present(UIAlertController.failure(message), animated: true)
    }
    
    func showLoginSuccess() {
        let scene = sceneFactory.makeLoginScene()
        source?.navigationController?.pushViewController(scene, animated: true)
    }
}

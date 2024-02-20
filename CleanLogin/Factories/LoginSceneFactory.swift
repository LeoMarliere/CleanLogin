//
//  ScdeneFactory.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import UIKit

protocol LoginSceneFactoryProtocol {
    var configurator: LoginSceneConfigurator! { get set }
    func makeLoginScene() -> UIViewController
}

final class LoginSceneFactory: LoginSceneFactoryProtocol {
    var configurator: LoginSceneConfigurator!
    
    func makeLoginScene() -> UIViewController {
        let vc = LoginSceneViewController()
        return configurator.configured(vc)
    }
}

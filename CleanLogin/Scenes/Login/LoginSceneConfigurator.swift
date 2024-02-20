//
//  DefaultLoginSceneConfigurator.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import Foundation

protocol LoginSceneConfiguratorProtocol {
    func configured(_ vc: LoginSceneViewController) -> LoginSceneViewController
}

final class LoginSceneConfigurator: LoginSceneConfiguratorProtocol {
    private var sceneFactory: LoginSceneFactoryProtocol
    
    init(sceneFactory: LoginSceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: LoginSceneViewController) -> LoginSceneViewController {
        sceneFactory.configurator = self
        
        let service = AuthService(networkManager: NetworkManager(session: MockNetworkSession()))
        let authWorker = LoginSceneAuthWorker(service: service)
        let interactor = LoginSceneInteractor()
        let presenter = LoginScenePresenter()
        let router = LoginSceneRouter(sceneFactory: sceneFactory)
        
        router.source = vc
        presenter.view = vc
        interactor.presenter = presenter
        interactor.authWorker = authWorker
        vc.interactor = interactor
        vc.router = router
        
        return vc
    }
}

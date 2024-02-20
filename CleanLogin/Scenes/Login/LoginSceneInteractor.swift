//
//  LoginSceneInteractor.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import Foundation

import UIKit

protocol LoginSceneInteractorProtocol: AnyObject {
    func tryToLogIn()
}

class LoginSceneInteractor {
    var presenter: LoginScenePresenterProtocol?
    var authWorker: LoginSceneAuthProtocol?
}

extension LoginSceneInteractor: LoginSceneInteractorProtocol {
    
    func tryToLogIn() {
        authWorker?.makeAuth(completion: { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let data):
                    self?.presenter?.presentLogingSuccess(user: data)
                case .failure(let error):
                    self?.presenter?.presentLogingFailure(message: error.localizedDescription)
                }
            }
        })
    }
    
}


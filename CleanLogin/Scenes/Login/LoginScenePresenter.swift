//
//  LoginScenePresenter.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import Foundation

protocol LoginScenePresenterProtocol: AnyObject {
    func presentLogingSuccess(user: CleanLoginUser)
    func presentLogingFailure(message: String)
}

class LoginScenePresenter {
    weak var view: LoginSceneViewControllerProtocol?
}

extension LoginScenePresenter: LoginScenePresenterProtocol {
    func presentLogingFailure(message: String) {
        view?.showLogingFailure(message: "")
    }
    
    func presentLogingSuccess(user: CleanLoginUser) {
        view?.showLogingSuccess(fullUserName: user.firstName + " " + user.lastName)
    }
}

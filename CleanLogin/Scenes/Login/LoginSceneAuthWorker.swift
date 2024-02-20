//
//  LoginSceneAuthWorker.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import Foundation

protocol LoginSceneAuthProtocol {
    func makeAuth( completion: @escaping (Result<CleanLoginUser, LoginSceneAuthWorker.LoginSceneAuthWorkerError>) -> Void)
}

final class LoginSceneAuthWorker {
    private let service: AuthService
    private var bag = Set<AnyCancellable>()
    
    init(service: AuthService) {
        self.service = service
    }
    
    enum LoginSceneAuthWorkerError: Error {
        case authFailed(String)
        case unauthorized
    }
}

extension LoginSceneAuthWorker: LoginSceneAuthProtocol {
    func makeAuth(completion: @escaping (Result<CleanLoginUser, LoginSceneAuthWorkerError>) -> Void) {
        service.auth().sink { _ in } receiveValue: { value in
            switch value.authorized {
            case true:
                completion(.success(CleanLoginUser()))
            case false:
                completion(.failure(.unauthorized))
            }
        }
        .store(in: &bag)
    }
}

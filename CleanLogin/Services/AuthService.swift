//
//  AuthService.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import Foundation
import Combine

protocol AuthServiceProtocol {
    func auth() -> AnyPublisher<AuthService.Response, Error>
}

struct AuthService: AuthServiceProtocol {
    struct Response: Decodable {
        let authorized: Bool
        let user: User?
        
        struct User: Decodable {
            let firstName: String
            let lastName: String
        }
    }

    struct ServiceError: Decodable, Error {
        let message: String
    }
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func auth() -> AnyPublisher<Response, Error> {
        networkManager.publisher(
            for: URLRequest(url: URL(string: "nothttps://netguru.com/api/authMeInPlease")!)
        )
    }
}

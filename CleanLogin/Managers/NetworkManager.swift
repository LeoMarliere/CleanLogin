//
//  NetworkManager.swift
//  CleanLogin
//
//  Created by Leo Marliere on 20/02/2024.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    var session: NetworkSessionProtocol { get }
    func publisher<T: Decodable>(for request: URLRequest) -> AnyPublisher<T, Error>
}

private extension NetworkManager {
    func makePublisher<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> {
        session.publisher(for: request)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct NetworkManager: NetworkManagerProtocol {
    private(set) var session: NetworkSessionProtocol
    
    init(session: NetworkSessionProtocol) {
        self.session = session
    }
    
    func publisher<T: Decodable>(for request: URLRequest) -> AnyPublisher<T, Error> {
        makePublisher(request: request)
    }
}



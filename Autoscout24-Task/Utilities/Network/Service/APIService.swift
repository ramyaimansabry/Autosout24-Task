//
//  APIService.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation
import Combine

final class APIService {
    static let shared = APIService()
    
    private init() {}
    
    private lazy var session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
}

// MARK: - APIServiceContract

extension APIService: APIServiceContract {
    func request<T: Codable>(
        using request: URLRequest,
        decoder: JSONDecoder,
        response: T.Type
    ) -> AnyPublisher<T, Error> {
        return session
            .dataTaskPublisher(for: request)
            .tryMap( {$0.data} )
            .decode(type: response, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

//
//  APIServiceContract.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation
import Combine

protocol APIServiceContract {
    func request<T: Codable>(
        using request: URLRequest,
        decoder: JSONDecoder,
        response: T.Type
    ) -> AnyPublisher<T, Error>
}

extension APIServiceContract {
    func request<T: Codable>(
        using request: URLRequest,
        response: T.Type = T.self
    ) -> AnyPublisher<T, Error> {
        self.request(using: request, decoder: JSONDecoder(), response: response)
    }
}

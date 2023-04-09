//
//  APIRequestBuilder.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation

class APIRequestBuilder {
    private(set) var urlRequest: URLRequest?
    
    func setPath(to path: APIConstants) -> APIRequestBuilder {
        guard let url = URL(string: path.rawValue) else {
            fatalError("Couldnt build url from \(path.rawValue)")
        }
        
        self.urlRequest = URLRequest(url: url)
        return self
    }
    
    func build() -> URLRequest {
        guard let urlRequest = urlRequest else {
            fatalError("Make sure to set url request path first")
        }
        
        return urlRequest
    }
}

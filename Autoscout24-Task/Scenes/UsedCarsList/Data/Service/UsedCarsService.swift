//
//  UsedCarsService.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Combine

final class UsedCarsService {
    private var apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
}

extension UsedCarsService: UsedCarsServiceContract {
    func fetchUsedCarsList() -> AnyPublisher<[UsedCarModel], Error> {
        let request = APIRequestBuilder()
            .setPath(to: .carsList)
            .build()
        
        return apiService
            .request(
                using: request,
                response: [UsedCarModel].self
            )
    }
}

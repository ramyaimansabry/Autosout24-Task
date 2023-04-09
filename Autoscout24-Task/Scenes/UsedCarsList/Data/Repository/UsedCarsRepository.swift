//
//  UsedCarsRepository.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Combine

final class UsedCarsRepository {
    private let service: UsedCarsServiceContract
    
    init(service: UsedCarsServiceContract = UsedCarsService()) {
        self.service = service
    }
}

extension UsedCarsRepository: UsedCarsRepositoryContract {
    func fetchUsedCarsList() -> AnyPublisher<[UsedCarModel], Error> {
        return service.fetchUsedCarsList()
    }
}

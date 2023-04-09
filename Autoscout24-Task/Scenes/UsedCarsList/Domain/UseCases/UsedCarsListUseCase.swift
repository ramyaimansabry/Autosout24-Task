//
//  UsedCarsListUseCase.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Combine

final class UsedCarsListUseCase {
    private let repository: UsedCarsRepositoryContract
    
    init(repository: UsedCarsRepositoryContract = UsedCarsRepository()) {
        self.repository = repository
    }
}

extension UsedCarsListUseCase: UsedCarsListUseCaseContract {
    func execute() -> AnyPublisher<[UsedCarModel], Error> {
        return repository.fetchUsedCarsList()
    }
}

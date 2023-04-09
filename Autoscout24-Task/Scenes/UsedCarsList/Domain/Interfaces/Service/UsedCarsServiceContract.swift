//
//  UsedCarsServiceContract.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Combine

protocol UsedCarsServiceContract {
    func fetchUsedCarsList() -> AnyPublisher<[UsedCarModel], Error>
}

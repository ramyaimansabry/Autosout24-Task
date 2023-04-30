//
//  UsedCarsUseCaseTests.swift
//  Autoscout24-TaskTests
//
//  Created by Ramy Sabry on 27/04/2023.
//

import XCTest
@testable import Autoscout24_Task
import Combine

final class UsedCarsUseCaseTests: XCTestCase {
    private var sut: UsedCarsListUseCase!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        cancellables = Set<AnyCancellable>()
        sut = UsedCarsListUseCase(repository: MoackUsedCarsRepository())
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        cancellables = nil
    }
    
    func testSUT_fetching_cars_list_returns_valid_data() {
        // Given
        let exp = expectation(description: "Fetching cars list data")
        
        // When
        sut.execute()
            .sink { completion in
                
            } receiveValue: { results in
                exp.fulfill()
                XCTAssert(results.isEmpty == false)
            }
            .store(in: &cancellables)

        // Then
        waitForExpectations(timeout: 1.0)
    }
}
                                  
class MoackUsedCarsRepository: UsedCarsRepositoryContract {
    func fetchUsedCarsList() -> AnyPublisher<[Autoscout24_Task.UsedCarModel], Error> {
        let mockedList: [UsedCarModel] = [UsedCarModel(
            id: 568,
            make: nil,
            model: nil,
            price: nil,
            firstRegistration: nil,
            mileage: nil,
            fuel: nil,
            images: nil,
            description: nil,
            modelline: nil,
            seller: nil,
            colour: nil
        )]
        
        return Future<[Autoscout24_Task.UsedCarModel], Error>.init { promise in
            return promise(.success(mockedList))
        }
        .eraseToAnyPublisher()
    }
}

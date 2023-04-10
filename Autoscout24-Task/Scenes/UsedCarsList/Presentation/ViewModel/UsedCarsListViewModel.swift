//
//  UsedCarsListViewModel.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation
import Combine

final class UsedCarsListViewModel: BaseViewModel, ObservableObject {
    private let useCase: UsedCarsListUseCaseContract
    
    @Published var carsList: [UsedCarModelRepresentable] = []
    
    init(useCase: UsedCarsListUseCaseContract = UsedCarsListUseCase()) {
        self.useCase = useCase
    }
}

// MARK: - Input Methods

extension UsedCarsListViewModel {
    func fetchData() {
        state = .loading
        useCase
            .execute()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case .failure(_) = completion {
                    self.state = .failed
                    // present error alert
                }
            } receiveValue: { [weak self] usedCars in
                guard let self = self else { return }
                self.carsList.append(contentsOf: usedCars)
                self.state = .successful
            }
            .store(in: &cancellables)
        
    }
}

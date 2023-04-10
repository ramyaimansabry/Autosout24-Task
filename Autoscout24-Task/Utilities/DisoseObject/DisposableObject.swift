//
//  DisposableObject.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Combine

class DisposableObject {
    var cancellables: Set<AnyCancellable>
    
    init() {
        cancellables = Set<AnyCancellable>()
    }
    
    deinit {
        cancellables.removeAll()
    }
}

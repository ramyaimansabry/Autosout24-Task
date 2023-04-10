//
//  BaseViewModel.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Combine

class BaseViewModel: DisposableObject {
    @Published var state: ViewModelState = .idle
}

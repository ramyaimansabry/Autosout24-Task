//
//  ViewModelState.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation

enum ViewModelState {
    case idle
    case loading
    case failed
    case successful
}

extension ViewModelState: Equatable {
    static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.successful, .successful): return true
        case (.failed, .failed): return true
        default:
            return false
        }
    }
}

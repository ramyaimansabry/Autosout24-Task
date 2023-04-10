//
//  BaseView.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    let content: Content
    
    @Binding private var state: ViewModelState
    
    init(
        state: Binding<ViewModelState>,
        @ViewBuilder content: () -> Content
    ) {
        self._state = state
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
                .disabled(state == .loading)
            
            progressView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var progressView: AnyView? {
        guard state == .loading else { return nil }
        
        return ProgressView()
            .scaleEffect(2)
            .eraseToAnyView()
    }
}

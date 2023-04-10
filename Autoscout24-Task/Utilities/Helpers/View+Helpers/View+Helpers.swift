//
//  View+Helpers.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

extension View {
    /// main screen width bounds
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    /// main screen width bounds
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}

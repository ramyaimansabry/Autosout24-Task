//
//  UsedCarsListView.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 07/04/2023.
//

import SwiftUI

struct UsedCarsListView: View {
    @StateObject private var viewModel = UsedCarsListViewModel()
    
    var body: some View {
//        BaseView(state: $viewModel.state) {
            List {
                ForEach(viewModel.carsList, id: \.id) { carData in
                    CarRowView(data: carData)
                        .listRowSeparator(.hidden)
                } //: ForEach
            } //: List
            .listStyle(.plain)
            .onAppear {
                viewModel.fetchData()
            }
//        } //: BaseView
    } //: body
}

struct UsedCarsListView_Previews: PreviewProvider {
    static var previews: some View {
        UsedCarsListView()
    }
}

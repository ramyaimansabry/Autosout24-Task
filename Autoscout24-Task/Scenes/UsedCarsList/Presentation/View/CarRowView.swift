//
//  CarRowView.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import SwiftUI

struct CarRowView: View {
    var data: UsedCarModelRepresentable
    
    var body: some View {
        VStack {
            imagesView
            
            VStack(alignment: .leading, spacing: 5) {
                Text(data.fullTitle)
                    .font(.title3)
                    .bold()
                
                Text(data.carPrice)
                    .font(.headline)
                
                VStack(spacing: 4) {
                    buildDataRow(
                        title: "First Registration",
                        value: data.carFirstRegistration
                    )
                    buildDataRow(
                        title: "Fuel",
                        value: data.carFuel
                    )
                    buildDataRow(
                        title: "Mileage",
                        value: data.carMileage
                    )
                    buildDataRow(
                        title: "Description",
                        value: data.carDescription
                    )
                }
            } //: VStack
            .padding()
        } //: VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.09))
        .cornerRadius(5)
    } //: body
    
    private var imagesView: AnyView {
        guard
            !data.carImages.isEmpty
        else {
            return emptyCarPlaceholderImageView
                .eraseToAnyView()
        }
        
        return ScrollView(.horizontal) {
            HStack {
                ForEach(data.carImages, id: \.self) { imageURL in
                    AsyncImage(url: URL(string: imageURL), content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .aspectRatio(16.0 / 9.0, contentMode: .fill)
                        
                    }, placeholder: {
                        ZStack {
                            emptyCarPlaceholderImageView
                                .scaledToFill()
                                
                            ProgressView()
                        }
                    })
                } //: ForEach
            } //: HStack
        } //: ScrollView
        .eraseToAnyView()
    }
    
    private var emptyCarPlaceholderImageView: some View {
        Image("placeholder-car")
            .resizable()
            .frame(height: 180)
            .frame(minWidth: 0, maxWidth: .infinity)
            .aspectRatio(16.0 / 9.0, contentMode: .fill)
    }
    
    private func buildDataRow(title: String, value: String?) -> AnyView? {
        guard let value = value else { return nil }
        return HStack(alignment: .top) {
            Text(title + ":")
                .font(.caption)
            
            Text(value)
                .font(.caption)
            
            Spacer()
        }
        .eraseToAnyView()
    }
}

//
//  UsedCarModelRepresentable.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation

protocol UsedCarRepresentable {
    var id: Int { get }
    var carImages: [String] { get }
    var fullTitle: String { get }
    var carPrice: String { get }
    var carFirstRegistration: String? { get }
    var carFuel: String { get }
    var carDescription: String? { get }
    var carMileage: String? { get }
}

extension UsedCarModel: UsedCarRepresentable {
    var carImages: [String] {
        return images?.compactMap({ $0.url }) ?? []
    }
    
    var fullTitle: String {
        return "\(make ?? "") \(model ?? "")"
    }
    
    var carPrice: String {
        guard let price = price else {
            return "Not Determined"
        }
        return "\(price) $"
    }
    
    var carFirstRegistration: String? {
        return firstRegistration
    }
    
    var carFuel: String {
        guard let fuel = fuel else { return "Not Determined"}
        return fuel.rawValue
    }
    
    var carDescription: String? {
        guard let description = description, description != "No description available." else { return nil }
        return description
    }
    
    var carMileage: String? {
        guard let mileage = mileage else { return nil }
        return "\(mileage) KM"
    }
}

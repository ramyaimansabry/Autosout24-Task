//
//  UsedCarModel.swift
//  Autoscout24-Task
//
//  Created by Ramy Sabry on 10/04/2023.
//

import Foundation

struct UsedCarModel: Codable {
    let id: Int
    let make: String?
    let model: String?
    let price: Int?
    let firstRegistration: String?
    let mileage: Int?
    let fuel: FuelType?
    let images: [ImageResponseModel]?
    let description: String?
    let modelline: String?
    let seller: CarSellerModel?
    let colour: String?
}

struct ImageResponseModel: Codable {
    let url: String?
}

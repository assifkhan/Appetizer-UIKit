//
//  AppitizerModel.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/2/23.
//

// MARK: - AppitizerModel
struct AppetizerModel: Codable {
    let request: [Request]
}

// MARK: - Request
struct Request: Codable {
    let carbs, protein: Int
    let name: String
    let id: Int
    let price: Double
    let description: String
    let calories: Int
    let imageURL: String?
}

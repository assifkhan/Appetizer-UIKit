//
//  NetworkResponse.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/2/23.
//

import Foundation

struct NetworkLayer {
    
    static func appitizerRequest() async throws -> AppetizerModel {
        
        guard let url = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers") else {
            throw NetworkError.invlidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let responseModel = try JSONDecoder().decode(AppetizerModel.self, from: data)
        return responseModel
    }
}

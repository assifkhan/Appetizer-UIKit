//
//  ImageDownloader.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/2/23.
//

import Foundation
import UIKit

class ImageDownloader {
    
    static func getImage(imageURL: String) async throws -> UIImage? {
        
        guard let imageURL = URL(string: imageURL) else {
            throw NetworkError.invlidURL
        }
        
        let (data, _) =  try await URLSession.shared.data(from: imageURL)
        return UIImage(data: data)
    }
}

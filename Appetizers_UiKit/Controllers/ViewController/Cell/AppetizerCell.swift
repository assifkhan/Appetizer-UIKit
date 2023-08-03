//
//  AppetizerCell.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/2/23.
//

import UIKit

class AppetizerCell: UITableViewCell {
    
    @IBOutlet weak var appetizerImage: UIImageView!
    @IBOutlet weak var appetizerNameLabel: UILabel!
    @IBOutlet weak var appetizerPriceLabel: UILabel!
    @IBOutlet weak var appetizerCorbLabel: UILabel!
    @IBOutlet weak var appetizerCaloriesLabel: UILabel!
    @IBOutlet weak var appetizerProteinLabel: UILabel!

    func config(appetizerModel: Request) {
        appetizerNameLabel.text = "Name: \(appetizerModel.name)"
        appetizerPriceLabel.text = "Price: $\(appetizerModel.price)"
        appetizerCorbLabel.text = "Carbs: \(appetizerModel.carbs)"
        appetizerCaloriesLabel.text = "Calories: \(appetizerModel.calories)"
        appetizerProteinLabel.text = "Protein: \(appetizerModel.protein)"
        
        if let imageURL = appetizerModel.imageURL {
            Task {
                do {
                    let appetizerImages = try await ImageDownloader.getImage(imageURL: imageURL)
                    appetizerImage.image = appetizerImages
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

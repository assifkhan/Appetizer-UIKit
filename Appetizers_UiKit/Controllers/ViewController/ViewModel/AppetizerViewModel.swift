//
//  AppitizerViewModel.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/2/23.
//

import Foundation
import UIKit

protocol AppetizerProtocol {
    
    var appetizerModel: AppetizerModel? { get }
    var getDataSuccessfully: (() -> Void)? { get set }
    func getResponse()
}

class AppetizerViewModel: AppetizerProtocol {
    
    var appetizerModel: AppetizerModel?
    var getDataSuccessfully: (() -> Void)?
    
    func getResponse() {
        
        Task {
            do {
                let response = try await NetworkLayer.appitizerRequest()
                appetizerModel = response
                getDataSuccessfully?()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

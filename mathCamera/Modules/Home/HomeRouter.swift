//
//  HomeRouter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    func navigateToPreview(image: UIImage)
}

class HomeRouter: HomeRouterProtocol {
    static let shared: HomeRouter = HomeRouter()
    
    func navigateToPreview(image: UIImage) {
        
    }
}

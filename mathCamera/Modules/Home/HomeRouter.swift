//
//  HomeRouter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    func navigateToPreview(from viewController: HomeViewController, with image: UIImage)
}

class HomeRouter: HomeRouterProtocol {
    static let shared: HomeRouter = HomeRouter()
    
    func navigateToPreview(from viewController: HomeViewController, with image: UIImage) {
        let vc = FeatureFactory.shared.createPreview(with: image)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

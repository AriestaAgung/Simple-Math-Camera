//
//  HomeInteractor.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit

protocol HomeUseCase {
    func fetchCameraImage() -> UIImage?
    func fetchGalleryImage() -> UIImage?
}

class HomeInteractor {
    static let shared: HomeInteractor = HomeInteractor()
}

extension HomeInteractor {
    
}

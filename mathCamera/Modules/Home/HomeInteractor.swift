//
//  HomeInteractor.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit

struct ImageViewModel {
    let image: UIImage?
    let data: Data?
    let stringOps: String?
}

protocol HomeUseCase {
    func fetchCameraImage() -> UIImage?
    func fetchGalleryImage() -> UIImage?
}

class HomeInteractor {
    static let shared: HomeInteractor = HomeInteractor()
}

extension HomeInteractor {
    
}

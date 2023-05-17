//
//  HomeInteractor.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation

protocol HomeUseCase {
    func fetchCameraImage()
    func fetchGalleryImage() -> UIImage?
}


//
//  ResultPreviewPresenter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit

struct ResultPreviewDataModel {
    var pickedImage: UIImage
}

struct ResultPreviewPresenterModel {
    let viewController: ResultPreviewViewController
    let interactor: ResultPreviewInteractor
    let router: ResultPreviewRouter
    let dataModel: ResultPreviewDataModel
}

protocol ResultPreviewPresenterProtocol {
//    func getString(image: UIImage) -> [String]?
    func getImage() -> UIImage
}

class ResultPreviewPresenter {
    private var presenterModel: ResultPreviewPresenterModel!
    private var dataModel: ResultPreviewDataModel!
    init(builder: ResultPreviewPresenterModel) {
        self.presenterModel = builder
    }
}

extension ResultPreviewPresenter: ResultPreviewPresenterProtocol {
//    func getString(image: UIImage) -> [String]? {
//        let string = presenterModel.interactor.processImage(image: image)
//    }
    func getImage() -> UIImage {
        return presenterModel.dataModel.pickedImage
    }
}

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
    func getString(image: UIImage, completion: @escaping ([String]?) -> Void)
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
    func getString(image: UIImage, completion: @escaping ([String]?) -> Void) {
        presenterModel.interactor.processImage(image: image)
        presenterModel.interactor.didGetText = { texts in
            dump(texts)
            completion(texts)
        }
    }
    func getImage() -> UIImage {
        return presenterModel.dataModel.pickedImage
    }
}

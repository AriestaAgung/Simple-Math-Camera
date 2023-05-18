//
//  ResultPreviewPresenter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit
struct ResultPreviewPresenterModel {
    let viewController: ResultPreviewViewController
    let interactor: ResultPreviewInteractor
    let router: ResultPreviewRouter
}

protocol ResultPreviewPresenterProtocol {
    func getString(image: UIImage) -> [String]?
}

class ResultPreviewPresenter {
    private var presenterModel: ResultPreviewPresenterModel!
    init(model: ResultPreviewPresenterModel) {
        self.presenterModel = model
    }
}

extension ResultPreviewPresenter: ResultPreviewPresenterProtocol {
    func getString(image: UIImage) -> [String]? {
        let string = presenterModel.interactor.processImage(image: image)
    }
}

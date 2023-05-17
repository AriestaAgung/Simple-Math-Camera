//
//  ResultPreviewPresenter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation

struct ResultPreviewPresenterModel {
    let viewController: ResultPreviewViewController
    let interactor: ResultPreviewInteractor
    let router: ResultPreviewRouter
}

protocol ResultPreviewPresenterProtocol {
    
}

class ResultPreviewPresenter {
    private var presenterModel: ResultPreviewPresenterModel!
    init(model: ResultPreviewPresenterModel) {
        self.presenterModel = model
    }
}

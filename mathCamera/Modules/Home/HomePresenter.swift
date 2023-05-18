//
//  HomePresenter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit
struct HomePresenterModel {
    let viewController: HomeViewController
    let interactor: HomeInteractor
    let router: HomeRouter
}

protocol HomePresenterProtocol {
    
    func navigateToResultPreview(image: UIImage)
}

class HomePresenter {
    private var presenterModel: HomePresenterModel!
    init(model: HomePresenterModel) {
        self.presenterModel = model
    }
}

extension HomePresenter: HomePresenterProtocol {
    func navigateToResultPreview(image: UIImage) {
        presenterModel.router.navigateToPreview(from: presenterModel.viewController, with: image)
    }
}

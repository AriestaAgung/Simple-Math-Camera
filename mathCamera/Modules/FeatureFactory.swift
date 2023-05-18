//
//  FeatureFactory.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import UIKit
class FeatureFactory {
    static let shared: FeatureFactory = FeatureFactory()
}

extension FeatureFactory {
    func createHome() -> HomeViewController{
        let vc = HomeViewController()
        let presenterModel = HomePresenterModel(
            viewController: vc,
            interactor: HomeInteractor.shared,
            router: HomeRouter.shared
        )
        vc.setupData(presenter: HomePresenter(model: presenterModel))
        return vc
    }
    func createPreview(with image: UIImage) -> ResultPreviewViewController {
        let vc = ResultPreviewViewController()
        let presenterBuilder = ResultPreviewPresenterModel(
            viewController: vc,
            interactor: ResultPreviewInteractor.shared,
            router: ResultPreviewRouter.shared,
            dataModel: ResultPreviewDataModel(pickedImage: image)
        )
        let presenter = ResultPreviewPresenter(builder: presenterBuilder)
        vc.setupData(presenter: presenter)
        return vc
    }
}

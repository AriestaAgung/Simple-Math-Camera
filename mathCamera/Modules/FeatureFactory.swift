//
//  FeatureFactory.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation

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
}

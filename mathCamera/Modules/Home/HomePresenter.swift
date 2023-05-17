//
//  HomePresenter.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation

struct HomePresenterModel {
    let viewController: HomeViewController
    let interactor: HomeInteractor
    let router: HomeRouter
}

protocol HomePresenterProtocol {
    
}

class HomePresenter {
    private var presenterModel: HomePresenterModel!
    init(model: HomePresenterModel) {
        self.presenterModel = model
    }
}

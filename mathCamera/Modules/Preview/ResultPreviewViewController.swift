//
//  ResultPreviewViewController.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import UIKit

class ResultPreviewViewController: UIViewController {

    
    private var presenter: ResultPreviewPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func setupData(presenter: ResultPreviewPresenter) {
        self.presenter = presenter
    }
    

}

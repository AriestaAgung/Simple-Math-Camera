//
//  ResultPreviewViewController.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import UIKit

class ResultPreviewViewController: UIViewController {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var expressionTitleLabel: UILabel!
    
    private var presenter: ResultPreviewPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func setupData(presenter: ResultPreviewPresenter) {
        self.presenter = presenter
    }
    

}

//
//  ViewController.swift
//  mathCamera
//
//  Created by BRIMO on 16/05/23.
//

import UIKit

enum MediaPickerType {
    case gallery
    case camera
}

class HomeViewController: UIViewController {

    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    let imagePicker: UIImagePickerController? = UIImagePickerController()
    private var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.galleryButton.layer.cornerRadius = 10
        self.cameraButton.layer.cornerRadius = 10
        self.galleryButton.setTitle("Choose From Gallery", for: .normal)
        self.cameraButton.setTitle("Choose From Camera", for: .normal)
        imagePicker?.delegate = self
        self.cameraButton.addTarget(self, action: #selector(openCameraAction), for: .touchUpInside)
        self.galleryButton.addTarget(self, action: #selector(openGallerycAction), for: .touchUpInside)
    }
    
    func setupData(presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    private func openMedia(with type: MediaPickerType) {
        switch type {
        case .gallery:
            imagePicker?.sourceType = .photoLibrary
        case .camera:
            imagePicker?.sourceType = .camera
        }
        if let imagePicker {
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc private func openCameraAction() {
        openMedia(with: .camera)
    }
    
    @objc private func openGallerycAction() {
        openMedia(with: .gallery)
    }
}

extension HomeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.presenter.navigateToResultPreview(image: image)
        }
    }
}


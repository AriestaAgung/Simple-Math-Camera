//
//  ResultPreviewInteractor.swift
//  mathCamera
//
//  Created by BRIMO on 17/05/23.
//

import Foundation
import Vision
import UIKit
struct ImagePreviewViewModel {
    let image: UIImage?
    let data: Data?
    let stringOps: String?
}


protocol ResultPreviewUseCase {
    func processImage(image: UIImage) -> [String]?
}

class ResultPreviewInteractor {
    static let shared: ResultPreviewInteractor = ResultPreviewInteractor()
}

extension ResultPreviewInteractor {
    func processImage(image: UIImage) -> [String]? {
        guard let cgImage = image.cgImage else {return []}
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        let recognizeRequest = VNRecognizeTextRequest { request, err in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                return
            }
            
            let recognizedStrings = observations.compactMap{ observation in
                observation.topCandidates(1).first?.string
            }
//            DispatchQueue.main.async {
//                return recognizedStrings
//            }
        }
        
        recognizeRequest.recognitionLevel = .accurate
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try requestHandler.perform([recognizeRequest])
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

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

struct ProcessedOperation {
    let firstNum: String?
    let operandSymbol: String?
    let secondNum: String?
}

protocol ResultPreviewUseCase {
    func processImage(image: UIImage)
    func operationDetector(_ text: String) -> ProcessedOperation?
    func evaluateMathOperation(_ mathString: String) -> Double?
}

class ResultPreviewInteractor {
    static let shared: ResultPreviewInteractor = ResultPreviewInteractor()
    var didGetText: (([String]) -> Void)?
    
}

extension ResultPreviewInteractor {
    func processImage(image: UIImage){
        guard let cgImage = image.cgImage else {return}
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        let recognizeRequest = VNRecognizeTextRequest { request, err in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                return
            }
            
            let recognizedStrings = observations.compactMap{ observation in
                observation.topCandidates(1).first?.string
            }
            self.didGetText?(recognizedStrings)
        }
        recognizeRequest.recognitionLevel = .accurate
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try requestHandler.perform([recognizeRequest])
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func operationDetector(_ text: String) -> ProcessedOperation? {
        let pattern = #"^(\d+)([-+*/])(\d+)$"#
        let regex = try! NSRegularExpression(pattern: pattern)
        
        guard let match = regex.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count)),
              match.numberOfRanges == 4 else {
            return nil
        }
        
        let captureGroupRanges = (1...3).map { match.range(at: $0) }
        let components = captureGroupRanges.compactMap { Range($0, in: text) }.map { String(text[$0]) }
        let result = ProcessedOperation(
            firstNum: components[0],
            operandSymbol: components[1],
            secondNum: components[2]
        )
        return result
    }
    
    func evaluateMathOperation(_ mathString: String) -> Double? {
        let expression = NSExpression(format: mathString)
        return expression.expressionValue(with: nil, context: nil) as? Double
    }
}

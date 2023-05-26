//
//  ResultPreviewInteractorTests.swift
//  mathCameraTests
//
//  Created by BRIMO on 25/05/23.
//

import XCTest
@testable import mathCamera

final class ResultPreviewInteractorTests: XCTestCase {

    
    var interactor: ResultPreviewInteractor?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        interactor = ResultPreviewInteractor.shared
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        
    }

    func testEvaluateMathOperator() throws {
        
        var result: Double?
        result = interactor?.evaluateMathOperation("995+5")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, 1000)
        
    }
    
    

    
}

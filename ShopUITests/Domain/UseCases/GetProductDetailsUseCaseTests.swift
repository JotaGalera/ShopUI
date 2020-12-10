//
//  GetProductDetailsUseCaseTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 10/12/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class GetProductDetailsUseCaseTests: XCTestCase {
    private var sut: GetProductDetailsUseCase!
    
    override func setUp() {
        sut = GetProductDetailsUseCaseImplementation()
    }
    
    func testThatExecuteReturnTrue_When_ExecuteIsCalled() {
        let result = sut.execute()
        
        XCTAssertTrue(result)
    }
}

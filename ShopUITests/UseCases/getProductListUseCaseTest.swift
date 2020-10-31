//
//  getProductListUseCaseTest.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 31/10/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class getProductListUseCaseTest: XCTestCase {
    private let sut: GetProductListUseCase = GetProductListUseCaseImplementation()
    
    override func setUp() {
        super.setUp()
    }
    
    func testThanExecuteIsCalled() {
        let productListMocked = ["ProductName": "Adidas originals trainers","size":"42"]
        
        let productListObtained = sut.execute()
        
        XCTAssertEqual(productListMocked, productListObtained)
    }
}

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
    private var sut: GetProductListUseCase?
    private var productListConverterMock = ProductListConverterMock()
    
    override func setUp() {
        super.setUp()
        sut = GetProductListUseCaseImplementation(converter: productListConverterMock)
    }
        
    func testThanProductListConverterIsCalled_When_ExecuteIsCalled(){
        productListConverterMock.convertProductListDataReturnValue = ProductListMock()
        
        _ = sut?.execute()
        
        XCTAssertEqual(1, productListConverterMock.convertProductListDataCallsCount)
    }
}

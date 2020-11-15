//
//  getProductListUseCaseTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 31/10/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class GetProductListUseCaseTests: XCTestCase {
    private var sut: GetProductListUseCase?
    private var productListConverterMock = ProductListConverterMock()
    private var repositoryMock = APIRepositoryMock()
    
    override func setUp() {
        super.setUp()
        setUpMocks()
        sut = GetProductListUseCaseImplementation(repository: repositoryMock, converter: productListConverterMock)
    }
    
    private func setUpMocks() {
        productListConverterMock.convertProductListDataReturnValue = ProductListMock()
    }
    
    func testThatExpectationIsFulFill_When_ExecuteIsCalled(){
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        _ = sut?.execute(onSuccess: { productlist in
            expectation.fulfill()
        }, onFailure: { _ in
            expectation.fulfill()
        })
        
    }
}

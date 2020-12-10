//
//  ProductDetailsViewModelTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 10/12/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class ProductDetailsViewModelTests: XCTestCase {
    private var sut: ProductDetailsViewModelImplementation!
    private var getProductDetailsUseCaseMock: GetProductDetailsUseCaseMock!
    
    override func setUp() {
        getProductDetailsUseCaseMock = GetProductDetailsUseCaseMock()
        sut = ProductDetailsViewModelImplementation(getProductDetailsUseCase: getProductDetailsUseCaseMock)
    }
    
    func testThatGetProductDetailsUseCaseIsCalled_When_GetProductDetailsIsCalled() {
        getProductDetailsUseCaseMock.executeReturnValue = true
        
        _ = sut.getProductDetails()

        XCTAssertEqual(1, getProductDetailsUseCaseMock.executeCallsCount)
    }
}

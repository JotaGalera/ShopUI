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
    private var configuratorMock: ProductDetailsConfiguratorMock!
    
    override func setUp() {
        getProductDetailsUseCaseMock = GetProductDetailsUseCaseMock()
        configuratorMock = ProductDetailsConfiguratorMock()
        configuratorMock.configureReturnValue = getProductDetailsUseCaseMock
        sut = ProductDetailsViewModelImplementation(configurator: configuratorMock)
    }
    
    func testThatGetProductDetailsUseCaseIsCalled_When_GetProductDetailsIsCalled() {
        _ = sut.getProductDetails(product_id: 1)

        XCTAssertEqual(1, getProductDetailsUseCaseMock.executeProductIdOnSuccessOnFailureCallsCount)
    }
}

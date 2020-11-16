//
//  ProductListViewModelTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 03/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class ProductListViewModelTests: XCTestCase {
    private var sut: ProductListViewModel?
    private var getProductListUseCaseMock = GetProductListUseCaseMock()
    private var productListMock = ProductListMock()
    
    override func setUp() {
        super.setUp()
        sut = ProductListViewModelImplementation(getProductListUseCase: getProductListUseCaseMock, productList: productListMock)
    }

    func testThatExecutedIsCalled_When_GetProductsIsCalled() {
        _ = sut?.getProductList()
        
        XCTAssertEqual(1, getProductListUseCaseMock.executeOnSuccessOnFailureCallsCount)
    }
}

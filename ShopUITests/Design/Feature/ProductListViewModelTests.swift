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
    
    override func setUp() {
        super.setUp()
        sut = ProductListViewModelImplementation(getProductListUseCase: getProductListUseCaseMock)
    }
    
    func testThanExecutedIsCalled_When_GetProductListIsCalled() {
        let productListMock = ProductListMock()
        productListMock.getProductsReturnValue = [Product(name: "product", brand: "brand", price: 0, currency: "€", image: "image")]
        getProductListUseCaseMock.executeReturnValue = productListMock
        
        _ = sut?.getProducts()
        
        XCTAssertEqual(1, getProductListUseCaseMock.executeCallsCount)
    }
}

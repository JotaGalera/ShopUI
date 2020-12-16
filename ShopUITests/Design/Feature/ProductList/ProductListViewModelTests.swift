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
    private var sut: ProductListViewModel!
    private var getProductListUseCaseMock: GetProductListUseCaseMock!
    private var productListMock: ProductListMock!
    private var configuratorMock: ProductListConfiguratorMock!
    
    override func setUp() {
        super.setUp()
        getProductListUseCaseMock = GetProductListUseCaseMock()
        configuratorMock = ProductListConfiguratorMock()
        configuratorMock.configureReturnValue = getProductListUseCaseMock
        productListMock = ProductListMock()
        sut = ProductListViewModelImplementation(configurator: configuratorMock, productList: productListMock)
    }

    func testThatExecutedIsCalled_When_GetProductsIsCalled() {
        _ = sut.getProductList()
        
        XCTAssertEqual(1, getProductListUseCaseMock.executeOnSuccessOnFailureCallsCount)
    }
    
    func testThatProductListHasProducts_When_GetProductListIsCalled() {
        let successExpectation = expectation(description: "success")
        let productMock = Product(name: "nameMock", color: "", brand: "brandMock", price: 1, original_price: 0.0, discount: 0.0, total_price: 0.0, currency: "currencyMock", image: "imageMock", detailsImages: [""])
        let listMock = ProductListImplementation()
        productListMock.getProductsReturnValue = listMock.getProducts()
        productListMock.setProducts(product: productMock)
        getProductListUseCaseMock.executeOnSuccessOnFailureClosure = { success, _ in
            success(listMock)
            successExpectation.fulfill()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            _ = self.sut.getProductList()
        })
        
        waitForExpectations(timeout: 6)
        XCTAssertEqual(listMock.getProducts(), productListMock.getProducts())
    }
    
    func testThatImageDataIsRequested_When_GetProductListIsCalled() {
        _ = self.sut.getImageData()
        
        XCTAssertEqual(1, productListMock.getImageDataCallsCount)
    }
    
    func testThatRequestDataErrorHasAnError_When_GetProductListIsCalled() {
        getProductListUseCaseMock.executeOnSuccessOnFailureClosure = {
            _, failure in
            failure("Data could not be getted")
        }
        
        _ = sut.getProductList()
        
        XCTAssertEqual("Data could not be getted", sut.getRequestDataError())
    }
}

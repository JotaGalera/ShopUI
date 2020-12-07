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
    
    override func setUp() {
        super.setUp()
        getProductListUseCaseMock = GetProductListUseCaseMock()
        productListMock = ProductListMock()
        sut = ProductListViewModelImplementation(getProductListUseCase: getProductListUseCaseMock, productList: productListMock)
    }

    func testThatExecutedIsCalled_When_GetProductsIsCalled() {
        _ = sut.getProductList()
        
        XCTAssertEqual(1, getProductListUseCaseMock.executeOnSuccessOnFailureCallsCount)
    }
    
    func testThatProductListHasProducts_When_GetProductListIsCalled() {
        let successExpectation = expectation(description: "success")
        let productMock = Product(name: "nameMock", brand: "brandMock", price: 1, currency: "currencyMock", image: "imageMock")
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

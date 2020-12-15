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
    private var productListConverterMock: ProductListConverterMock!
    private var repositoryMock: APIRepositoryMock!
    
    override func setUp() {
        super.setUp()
        productListConverterMock = ProductListConverterMock()
        repositoryMock = APIRepositoryMock()
        setUpMocks()
        sut = GetProductListUseCaseImplementation(repository: repositoryMock, converter: productListConverterMock)
    }
    
    private func setUpMocks() {
        productListConverterMock.convertProductListDataReturnValue = ProductListMock()
    }
    
    func testThatRepositoryMockIsCalled_When_ExecuteIsCalled() {
        let successExpectation = expectation(description: "success")
        repositoryMock.getProductListOnSuccessOnFailureClosure = {
            success , _ in
            let productListDataMock = [["name":"mock name","brand":"mock brand","price":10,"currency":"€","image":"mock image"]]
            success(productListDataMock)
        }
        
        _ = sut?.execute(onSuccess: { productlist in
            successExpectation.fulfill()
        }, onFailure: { _ in })
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(1, self.repositoryMock.getProductListOnSuccessOnFailureCallsCount)
    }
    
    func testThatErrorIsReturned_When_ExecuteIsCalled() {
        let failureExpectation = expectation(description: "failure")
        repositoryMock.getProductListOnSuccessOnFailureClosure = {
            _ , failure in
            let productListDataMock = "Data could not be getted"
            failure(productListDataMock)
        }
        
        _ = sut?.execute(onSuccess: { _ in },
                         onFailure: { error in
                            XCTAssertEqual("Data could not be getted", error)
                            failureExpectation.fulfill()
                         })
        
        waitForExpectations(timeout: 10)
    }
}

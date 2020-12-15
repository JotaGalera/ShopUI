//
//  GetProductDetailsUseCaseTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 10/12/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class GetProductDetailsUseCaseTests: XCTestCase {
    private var sut: GetProductDetailsUseCase!
    private var repositoryMock: APIRepositoryMock!
    
    override func setUp() {
        repositoryMock = APIRepositoryMock()
        sut = GetProductDetailsUseCaseImplementation(repository: repositoryMock)
    }
    
    func testThatRepositoryIsCalled_When_ExecuteIsCalled() {
        let successExpectation = expectation(description: "success")
        let productIDMock = 1
        repositoryMock.getProductDetailsProductIdOnSuccessOnFailureClosure = { _, success, _ in
            success(["name":"mock name","color":"mock color","brand":"mock brand","original_price":1.0,"discount":1.0,"total_price":1.0,"currency":"€","images":["mock image"]] as [String : Any])
        }
        
        _ = sut.execute(product_id: productIDMock,
                        onSuccess: { productDetails in
                            successExpectation.fulfill()
                        },
                        onFailure: { _ in })
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(1, self.repositoryMock.getProductDetailsProductIdOnSuccessOnFailureCallsCount)
    }
    
    func testThatErrorIsReturned_When_ExecuteIsCalled() {
        let failureExpectation = expectation(description: "failure")
        let productIDMock = 1
        repositoryMock.getProductDetailsProductIdOnSuccessOnFailureClosure = { _, _, failure in
            let productListDataMock = "Data could not be getted"
            failure(productListDataMock)
        }
        
        _ = sut?.execute(product_id: productIDMock,
                         onSuccess: { _ in },
                         onFailure: { error in
                            XCTAssertEqual("Data could not be getted", error)
                            failureExpectation.fulfill()
                         })
        
        waitForExpectations(timeout: 10)
    }
}

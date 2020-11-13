//
//  getProductListUseCaseTest.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 31/10/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class GetProductListUseCaseTest: XCTestCase {
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
        repositoryMock.getProductListReturnValue = [["KeyMock":"ValueMock"]]
    }
    
    func testThatProductListConverterIsCalled_When_ExecuteIsCalled(){
        _ = sut?.execute()
        
        XCTAssertEqual(1, productListConverterMock.convertProductListDataCallsCount)
    }
    
    func testThatRepositoryGetProductListIsCalled_When_ExecuteIsCalled(){
        _ = sut?.execute()
        
        XCTAssertEqual(1, repositoryMock.getProductListCallsCount)
    }
}

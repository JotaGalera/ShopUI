//
//  APIRepositoryTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 14/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class APIRepositoryTests: XCTestCase {
    private var sut: APIRepository?
    private var dataSourceMock = APIDataSourceMock()
    
    override func setUp() {
        super.setUp()
        sut = APIRepositoryImplementation(dataSource: dataSourceMock)
    }
    
    func testThatDataSourceGetProductListIsCalled_When_GetProductListIsCalled() {
        _ = sut?.getProductList(onSuccess: { _ in
            "success"
        }, onFailure: { _ in
            "error"
        })
        
        XCTAssertEqual(1, dataSourceMock.getProductListOnSuccessOnFailureCallsCount)
    }
}

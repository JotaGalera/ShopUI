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
    
    func testThatExecuteReturnTrue_When_ExecuteIsCalled() {
        repositoryMock.getProductDetailsReturnValue = true
        
        let result = sut.execute()
        
        XCTAssertTrue(result)
    }
    
    func testThatRepositoryIsCalled_When_ExecuteIsCalled() {
        repositoryMock.getProductDetailsReturnValue = true
        
        _ = sut.execute()
        
        XCTAssertEqual(1, repositoryMock.getProductDetailsCallsCount)
    }
}

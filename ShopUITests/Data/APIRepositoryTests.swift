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
    private var sut: APIRepository!
    private var dataSourceMock: APIDataSourceMock!
    private var listMapperMock: APIListMapperMock!
    private var detailsMapperMock: APIDetailsMapperMock!
    
    override func setUp() {
        super.setUp()
        dataSourceMock = APIDataSourceMock()
        listMapperMock = APIListMapperMock()
        detailsMapperMock = APIDetailsMapperMock()
        sut = APIRepositoryImplementation(dataSource: dataSourceMock, listMapper: listMapperMock, detailsMapper: detailsMapperMock)
    }
    
    func testThatDataSourceGetProductListIsCalled_When_GetProductListIsCalled() {
        _ = sut.getProductList(onSuccess: { _ in }, onFailure: { _ in })
        
        XCTAssertEqual(1, dataSourceMock.getProductListOnSuccessOnFailureCallsCount)
    }
    
    func testThatMapperConvertIsCalled_When_GetProductListIsCalled() {
        let productListDataMock = [["name":"mock name","brand":"mock brand","price":10,"currency":"€","image":"mock image"]]
        listMapperMock.convertDataReturnValue = productListDataMock
        dataSourceMock.getProductListOnSuccessOnFailureClosure = { success, _ in
            guard let dataMock = String( "{list: [{id: 1,name: mock name,brand: mock brand,price: 10,currency: €,image: mock image}],page: 1,pageSize: 5,size: 20}").data(using: .utf8)
            else { return }
            success(dataMock)
        }
        
        _ = sut.getProductList(onSuccess: { _ in }, onFailure: { _ in })
        
        XCTAssertEqual(1, listMapperMock.convertDataCallsCount)
    }
    
    func testThatADictionaryWithDataProductsIsGetted_When_GetProductListIsCalled() {
        let productListDataMock = [["name":"mock name","brand":"mock brand","price":10,"currency":"€","image":"mock image"]]
        let successExpectation = expectation(description: "success")
        listMapperMock.convertDataReturnValue = productListDataMock
        dataSourceMock.getProductListOnSuccessOnFailureClosure = { success, _ in
            guard let dataMock = String( "{list: [{id: 1,name: mock name,brand: mock brand,price: 10,currency: €,image: mock image}],page: 1,pageSize: 5,size: 20}").data(using: .utf8)
            else { return }
            success(dataMock)
        }

        _ = sut.getProductList(onSuccess: { result in
            XCTAssertEqual(productListDataMock[0]["name"] as! String, result[0]["name"] as! String)
            XCTAssertEqual(productListDataMock[0]["brand"] as! String, result[0]["brand"] as! String)
            XCTAssertEqual(productListDataMock[0]["price"] as! Int, result[0]["price"] as! Int)
            XCTAssertEqual(productListDataMock[0]["currency"] as! String, result[0]["currency"] as! String)
            XCTAssertEqual(productListDataMock[0]["image"] as! String, result[0]["image"] as! String)
            successExpectation.fulfill()
        }, onFailure: { _ in })
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(1, listMapperMock.convertDataCallsCount)
    }
    
    func testThatAnErrorMessageIsReceived_When_GetProductListIsCalled() {
        let failureExpectation = expectation(description: "failure")
        dataSourceMock.getProductListOnSuccessOnFailureClosure = { _, error in
            error("Data could not be getted")
        }
        
        _ = sut.getProductList(onSuccess: { _ in },
                               onFailure: { error in
                                XCTAssertEqual("Data could not be getted", error)
                                failureExpectation.fulfill()
                               })
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(0, listMapperMock.convertDataCallsCount)
    }
    
    func testThatTrueIsReturned_When_GetProductDetailsIsCalled() {
        dataSourceMock.getProductDetailsReturnValue = true
        
        let result = sut.getProductDetails()
        
        XCTAssertTrue(result)
    }
    
    func testThatAPIDataSourceIsCalled_When_GetproductDetailsIsCalled() {
        dataSourceMock.getProductDetailsReturnValue = true
        
        _ = sut.getProductDetails()
        
        XCTAssertEqual(1, dataSourceMock.getProductDetailsCallsCount)
    }
}


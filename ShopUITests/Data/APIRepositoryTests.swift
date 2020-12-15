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
    
    func testThatListMapperConvertIsCalled_When_GetProductListIsCalled() {
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
    
    func testThatDataSourceGetProductDetailsIsCalled_When_GetProductDetailsIsCalled() {
        let productIDMock = 1
        
        _ = sut.getProductDetails(product_id: productIDMock, onSuccess: { _ in }, onFailure: { _ in})
        
        XCTAssertEqual(1, dataSourceMock.getProductDetailsProductIdOnSuccessOnFailureCallsCount)
    }
    
    func testThatDetailMapperConvertIsCalled_When_GetProductDetailsIsCalled() {
        let productDetailsDataMock = ["name":"mock name","color":"mock color","brand":"mock brand","original_price":1,"discount":1,"total_price":1,"currency":"€","images":["mock image"]] as [String : Any]
        detailsMapperMock.convertDataReturnValue = productDetailsDataMock
        dataSourceMock.getProductDetailsProductIdOnSuccessOnFailureClosure = { _, success, _ in
            guard let dataMock = String( "{id: 1,name:mock name,color:mock color,brand:mock brand,original_price:1,discount:1,total_price:1,currency:€,images:[mock image]}").data(using: .utf8)
            else { return }
            success(dataMock)
        }
        
        _ = sut.getProductDetails(product_id: 1, onSuccess: { _ in }, onFailure: { _ in })
        
        XCTAssertEqual(1, detailsMapperMock.convertDataCallsCount)
    }
    
    func testThatADictionaryWithDataProductDetailsIsGetted_When_GetProductDetailsIsCalled() {
        let productIDMock = 1
        let productDetailsDataMock = ["name":"mock name","color":"mock color","brand":"mock brand","original_price":1.0,"discount":1.0,"total_price":1.0,"currency":"€","images":["mock image"]] as [String : Any]
        let successExpectation = expectation(description: "success")
        detailsMapperMock.convertDataReturnValue = productDetailsDataMock
        dataSourceMock.getProductDetailsProductIdOnSuccessOnFailureClosure = { _, success, _ in
            guard let dataMock = String( "{id: 1,name:mock name,color:mock color,brand:mock brand,original_price:1,discount:1,total_price:1,currency:€,images:[mock image]}").data(using: .utf8)
            else { return }
            success(dataMock)
        }

        _ = sut.getProductDetails(product_id: productIDMock,
                                  onSuccess: { result in
                                    XCTAssertEqual(productDetailsDataMock["name"] as! String, result["name"] as! String)
                                    XCTAssertEqual(productDetailsDataMock["color"] as! String, result["color"] as! String)
                                    XCTAssertEqual(productDetailsDataMock["brand"] as! String, result["brand"] as! String)
                                    XCTAssertEqual(productDetailsDataMock["original_price"] as! Double, result["original_price"] as! Double)
                                    XCTAssertEqual(productDetailsDataMock["discount"] as! Double, result["discount"] as! Double)
                                    XCTAssertEqual(productDetailsDataMock["total_price"] as! Double, result["total_price"] as! Double)
                                    XCTAssertEqual(productDetailsDataMock["currency"] as! String, result["currency"] as! String)
                                    XCTAssertEqual(productDetailsDataMock["images"] as! [String], result["images"] as! [String])
                                    successExpectation.fulfill()
        }, onFailure: { _ in })
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(1, detailsMapperMock.convertDataCallsCount)
    }
    
    func testThatAnErrorMessageIsReceived_When_GetProductDetailsIsCalled() {
        let productIDMock = 1
        let failureExpectation = expectation(description: "failure")
        dataSourceMock.getProductDetailsProductIdOnSuccessOnFailureClosure = { _, _, error in
            error("Data could not be getted")
        }
        
        _ = sut.getProductDetails(product_id: productIDMock,
                                  onSuccess: { _ in },
                                  onFailure: { error in
                                    XCTAssertEqual("Data could not be getted", error)
                                    failureExpectation.fulfill()
                                  })
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(0, listMapperMock.convertDataCallsCount)
    }
}



//
//  ProductListConverterTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 01/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class ProductListConverterTests: XCTestCase {
    private var sut: ProductListConverter!
    private var productConverterMock: ProductConverterMock!
    
    override func setUp() {
        super.setUp()
        productConverterMock = ProductConverterMock()
        sut = ProductListConverterImplementation(productConverter: productConverterMock)
    }
    
    func testThatProductConverterIsCalled_When_ConvertIsCalled() {
        let productListDataMock = [["name":"trainers","brand":"Adidas","price":50,"currency":"€","image":"image"]]
        let productMock = Product(name: "trainers",brand: "Adidas",price: 50,currency: "€",image: "image")
        let productListMock = ProductListImplementation()
        productListMock.setProducts(product: productMock)
        productConverterMock.convertDataReturnValue = productMock
        
        let _ = sut.convert(productListData: productListDataMock)
        
        XCTAssertEqual(1, productConverterMock.convertDataCallsCount)
    }
    
    func testThatProductListConverterIsRerturningProductListImplementation_When_ConvertIsCalled() {
        let productListDataMock = [["name":"trainers","brand":"Adidas","price":50,"currency":"€","image":"image"]]
        let productMock = Product(name: "trainers",brand: "Adidas",price: 50,currency: "€",image: "image")
        let productListMock = ProductListImplementation()
        productListMock.setProducts(product: productMock)
        productConverterMock.convertDataReturnValue = productMock
        
        let productListConverted = sut.convert(productListData: productListDataMock)
        
        XCTAssertEqual(productListMock, productListConverted as! ProductListImplementation)
    }
}

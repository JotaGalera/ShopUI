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
    private var sut: ProductListConverter?
    
    override func setUp() {
        super.setUp()
        sut = ProductListConverterImplementation()
    }
    
    func testThatProductListConverterIsRerturningProductListImplementation_When_ConvertIsCalled() {
        let productListDataMock = [["name":"trainers","brand":"Adidas","price":50,"currency":"€","image":"image"]]
        let productMock = Product(name: "trainers",brand: "Adidas",price: 50,currency: "€",image: "image")
        let productListMock = ProductListImplementation()
        
        productListMock.setProducts(product: productMock)
        let productListReturned = sut?.convert(productListData: productListDataMock)
        
        XCTAssertEqual(productListMock, productListReturned as! ProductListImplementation)
    }
}

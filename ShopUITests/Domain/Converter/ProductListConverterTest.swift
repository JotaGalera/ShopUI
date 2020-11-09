//
//  ProductListConverterTest.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 01/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class ProductListConverterTest: XCTestCase {
    private let sut: ProductListConverter = ProductListConverterImplementation()
    
    override func setUp() {
        super.setUp()
    }
    
    func testThanProductListConverterIsRerturningProductListImplementation_When_ConvertIsCalled() {
        let productListDataMock = [["ProductName":"trainers","brand":"Adidas","price":"50","currency":"€","image":"image"]]
        let productMock = Product(name: "trainers",brand: "Adidas",price: 50,currency: "€",image: "image")
        let productListMock = ProductListImplementation()
        
        productListMock.setProducts(product: productMock)
        let productListReturned = sut.convert(productListData: productListDataMock)
        
        XCTAssertEqual(productListMock, productListReturned as! ProductListImplementation)
    }
}

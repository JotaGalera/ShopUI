//
//  ProductConverterTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 30/11/2020.
//
@testable import ShopUI
import Foundation
import XCTest

class ProductConverterTests: XCTestCase {
    private var sut: ProductConverter!
    
    override func setUp() {
        super.setUp()
        sut = ProductConverterImplementation()
    }
    
    func testThatAProductIsReturned_When_ConvertIsCalled(){
        let productMock = Product(name: "trainers",brand: "Adidas",price: 50,currency: "€",image: "image")
        let productDataMock: [String: Any] = ["name":"trainers","brand":"Adidas","price":50,"currency":"€","image":"image"]
        
        let productConverted = sut.convert(data: productDataMock)
        
        XCTAssertEqual(productMock, productConverted)
    }
}

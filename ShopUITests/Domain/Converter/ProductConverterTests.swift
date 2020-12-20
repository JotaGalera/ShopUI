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
        let productMock = Product(name: "nameMock", color: "", brand: "brandMock", price: 1, originalPrice: 0.0, discount: 0.0, totalPrice: 0.0, currency: "currencyMock", image: "imageMock", detailsImages: [""])
        let productDataMock: [String: Any] = ["name":"nameMock","brand":"brandMock","price":1.0,"currency":"currencyMock","image":"imageMock"]
        
        let productConverted = sut.convert(data: productDataMock)
        
        XCTAssertEqual(productMock, productConverted)
    }
}

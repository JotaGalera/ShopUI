//
//  ProductListTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 01/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class ProductListTests: XCTestCase {
    private var sut: ProductList?
    
    override func setUp() {
        super.setUp()
        sut = ProductListImplementation()
    }
    
    func testThatProductListAIsEqualToProductListB_When_TheyHaveTheSameContent() {
        let productMock = Product(name: "nameMock", color: "colorMock", brand: "brandMock", price: 1, original_price: 1, discount: 1, total_price: 1, currency: "currencyMock", image: "imageMock", detailsImages: ["imageMock"])
        let productListA = ProductListImplementation()
        let productListB = ProductListImplementation()
        
        productListA.setProducts(product: productMock)
        productListB.setProducts(product: productMock)
        
        XCTAssertEqual(productListA, productListB)
        XCTAssertEqual(productListA.getProducts(), productListB.getProducts())
    }
    
    func testThatProductListAIsNotEqualToProductListB_When_TheyHaveDifferentContent() {
        let productMock = Product(name: "nameMock", color: "colorMock", brand: "brandMock", price: 1, original_price: 1, discount: 1, total_price: 1, currency: "currencyMock", image: "imageMock", detailsImages: ["imageMock"])
        let productMock2 = Product(name: "nameMock2", color: "colorMock2", brand: "brandMock2", price: 2, original_price: 2, discount: 2, total_price: 2, currency: "currencyMock2", image: "imageMock2", detailsImages: ["imageMock2"])
        let productListA = ProductListImplementation()
        let productListB = ProductListImplementation()
        
        productListA.setProducts(product: productMock)
        productListB.setProducts(product: productMock2)
        
        XCTAssertNotEqual(productListA, productListB)
        XCTAssertNotEqual(productListA.getProducts(), productListB.getProducts())
    }
    
    func testThatProductListAIsNotEqualToProductListB_When_TheyHaveDifferentNumberOfProducts() {
        let productMock = Product(name: "nameMock", color: "colorMock", brand: "brandMock", price: 1, original_price: 1, discount: 1, total_price: 1, currency: "currencyMock", image: "imageMock", detailsImages: ["imageMock"])
        let productListA = ProductListImplementation()
        let productListB = ProductListImplementation()
        
        productListA.setProducts(product: productMock)
        productListB.setProducts(product: productMock)
        productListB.setProducts(product: productMock)
        
        XCTAssertNotEqual(productListA, productListB)
        XCTAssertNotEqual(productListA.getProducts(), productListB.getProducts())
    }
}

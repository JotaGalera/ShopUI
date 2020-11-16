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
        let productMock = Product(name: "product", brand: "brandProduct", price: 5, currency: "€", image: "image")
        let productListA = ProductListImplementation()
        let productListB = ProductListImplementation()
        
        productListA.setProducts(product: productMock)
        productListB.setProducts(product: productMock)
        
        XCTAssertEqual(productListA, productListB)
        XCTAssertEqual(productListA.getProducts(), productListB.getProducts())
    }
    
    func testThatProductListAIsNotEqualToProductListB_When_TheyHaveDifferentContent() {
        let productMock = Product(name: "product", brand: "brandProduct", price: 5, currency: "€", image: "image")
        let productMock2 = Product(name: "product2", brand: "brandProduct2", price: 6, currency: "€", image: "image")
        let productListA = ProductListImplementation()
        let productListB = ProductListImplementation()
        
        productListA.setProducts(product: productMock)
        productListB.setProducts(product: productMock2)
        
        XCTAssertNotEqual(productListA, productListB)
        XCTAssertNotEqual(productListA.getProducts(), productListB.getProducts())
    }
    
    func testThatProductListAIsNotEqualToProductListB_When_TheyHaveDifferentNumberOfProducts() {
        let productMock = Product(name: "product", brand: "brandProduct", price: 5, currency: "€", image: "image")
        let productListA = ProductListImplementation()
        let productListB = ProductListImplementation()
        
        productListA.setProducts(product: productMock)
        productListB.setProducts(product: productMock)
        productListB.setProducts(product: productMock)
        
        XCTAssertNotEqual(productListA, productListB)
        XCTAssertNotEqual(productListA.getProducts(), productListB.getProducts())
    }
}
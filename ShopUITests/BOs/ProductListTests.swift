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
}

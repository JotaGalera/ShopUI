//
//  ProductDetailViewTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 08/12/2020.
//

@testable import ShopUI

import SwiftUI
import SnapshotTesting
import XCTest

class ProductDetailViewTests: XCTestCase {
    func testProductDetailView() {
        let productMock = Product(name: "nameMock", brand: "brandMock", price: 1, currency: "currencyMock", image: "imageMock")
        let productDetailView = ProductDetailView(selectedProduct: productMock)
        
        let result = verifySnapshot(matching: productDetailView, as: .image)
        
        XCTAssertNil(result)
    }
}

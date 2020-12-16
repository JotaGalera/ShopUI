//
//  ProductDetailsViewTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 08/12/2020.
//

@testable import ShopUI

import SwiftUI
import SnapshotTesting
import XCTest

class ProductDetailsViewTests: XCTestCase {
    func testProductDetailView() {
        let productMock = Product(name: "nameMock", color: "colorMock", brand: "brandMock", price: 0.0, original_price: 1, discount: 1, total_price: 1, currency: "currencyMock", image: "", detailsImages: ["imageMock"])
        let productDetailView = ProductDetailsView(selectedProduct: productMock)
        
        let result = verifySnapshot(matching: productDetailView, as: .image)
        
        XCTAssertNil(result)
    }
}

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
        let productMock: Product = Product(name: "nameMock", color: "colorMock", brand: "brandMock", price: 0.0, originalPrice: 0.0, discount: 0.0, totalPrice: 0.0, currency: "€", image: "imageMock", detailsImages: ["detailsImage"])
        let productDetailsVMMock = ProductDetailsViewModelImplementation(product: productMock)
        let productDetailView = ProductDetailsView(productDetailsViewModel: productDetailsVMMock, selectedProduct: 0).frame(width: 450, height: 600)
        
        let result = verifySnapshot(matching: productDetailView, as: .image)
        
        XCTAssertNil(result)
    }
}

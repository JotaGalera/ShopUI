//
//  ProductListViewTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 03/11/2020.
//
@testable import ShopUI

import SwiftUI
import SnapshotTesting
import XCTest

class ProductListViewTests: XCTestCase {
    func testProductListView() {
        let productMock = Product(name: "nameMock", color: "", brand: "brandMock", price: 1.0, original_price: 0.0, discount: 0.0, total_price: 0.0, currency: "currencyMock", image: "imageMock", detailsImages: [""])
        let getProductListUseCaseMock = GetProductListUseCaseMock()
        let configuratorMock = ProductListConfiguratorMock()
        configuratorMock.configureReturnValue = getProductListUseCaseMock
        let productListMock = ProductListImplementation()
        productListMock.setProducts(product: productMock)
        let productListViewModelMock = ProductListViewModelImplementation(configurator: configuratorMock, productList: productListMock)
        
        let productListView = NavigationView(content: {
            ProductListView(productListViewModel: productListViewModelMock)
        })
        
        
        let result = verifySnapshot(matching: productListView, as: .image)
        
        XCTAssertNil(result)
    }
}

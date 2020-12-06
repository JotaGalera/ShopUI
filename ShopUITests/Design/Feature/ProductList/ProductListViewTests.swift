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
        let productMock = Product(name: "nameMock", brand: "brandMock", price: 1, currency: "currencyMock", image: "image")
        let getProductListUseCaseMock = GetProductListUseCaseMock()
        let productListMock = ProductListImplementation()
        productListMock.setProducts(product: productMock)
        let productListViewModelMock = ProductListViewModelImplementation(getProductListUseCase: getProductListUseCaseMock, productList: productListMock)
        
        let productListView = NavigationView(content: {
            ProductListView(productListViewModel: productListViewModelMock)
        })
        
        
        let result = verifySnapshot(matching: productListView, as: .image)
        
        XCTAssertNil(result)
    }
}

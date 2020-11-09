//
//  ProductListView.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 03/11/2020.
//
@testable import ShopUI

import SwiftUI
import SnapshotTesting
import XCTest

class ProductListViewTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    func testView() {
        let sut = ProductListView()

        assertSnapshot(matching: sut, as: .image, record: false)
    }
}

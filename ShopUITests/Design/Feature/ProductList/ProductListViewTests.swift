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
    private var sut: ProductListView!
    private var isRecordingScreen: Bool!
    
    override func setUp() {
        super.setUp()
        isRecordingScreen = false
        sut = ProductListView()
    }
    
    func testView() {
        assertSnapshot(matching: sut, as: .image, record: isRecordingScreen)
    }
}

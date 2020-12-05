//
//  LoadViewTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 05/12/2020.
//
@testable import ShopUI

import SwiftUI
import SnapshotTesting
import XCTest

class LoadViewTests: XCTestCase {
    func testLoadView() {
        let shopAnimation = UIShopAnimation()
        
        let result = verifySnapshot(matching: shopAnimation, as: .image)
        
        XCTAssertNil(result)
    }
    
    func testTittle() {
        let title = Title(titlePercentage: .constant(1.0), color: .black)
        
        let result = verifySnapshot(matching: title, as: .image)
        
        XCTAssertNil(result)
    }
    
    func testSubttile() {
        let title = Subtitle(subtitlePercentage: .constant(1.0), color: .black)
        
        let result = verifySnapshot(matching: title, as: .image)
        
        XCTAssertNil(result)
    }
}

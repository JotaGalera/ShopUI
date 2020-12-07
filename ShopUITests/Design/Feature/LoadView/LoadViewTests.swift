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
    
    func testContinueButtonEnabled() {
        let continueButton = ContinueButton(selectionView: .constant(1), isContinueButtonDisabled: false)
            .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        let result = verifySnapshot(matching: continueButton, as: .image)
        
        XCTAssertNil(result)
    }
    
    func testContinueButtonDisabled() {
        let continueButton = ContinueButton(selectionView: .constant(1), isContinueButtonDisabled: true)
            .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        let result = verifySnapshot(matching: continueButton, as: .image)
        
        XCTAssertNil(result)
    }
    
    func testTittle() {
        let title = Title(titlePercentage: .constant(1.0), color: .black)
            .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        let result = verifySnapshot(matching: title, as: .image)
        
        XCTAssertNil(result)
    }
    
    func testSubtitle() {
        let subtitle = Subtitle(subtitlePercentage: .constant(1.0), subtitleColor: .black)
            .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        let result = verifySnapshot(matching: subtitle, as: .image)
        
        XCTAssertNil(result)        
    }
}

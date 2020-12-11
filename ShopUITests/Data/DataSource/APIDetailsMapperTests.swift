//
//  APIDetailsMapperTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 11/12/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class APIDetailsMapperTests: XCTestCase {
    private var sut: APIDetailsMapper!
    
    override func setUp() {
        sut = APIDetailsMapperImplementation()
    }
    
    func testConvertReturnTrue() {
        XCTAssertTrue(sut.convert())
    }
}

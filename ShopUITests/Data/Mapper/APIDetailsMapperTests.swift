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
        let dataMock = """
                            {
                               "id": 1,
                               "name": "mock name",
                               "color": "mock color",
                               "brand": "mock brand",
                               "original_price": 1,
                               "discount": 1,
                               "total_price": 1,
                               "currency": "€",
                               "images": ["mock image"]
                            }
                        """.data(using: .utf8)!
        
        let dictionary = sut.convert(data: dataMock)
        
        XCTAssertNotNil(dictionary)
        XCTAssertEqual("mock name", dictionary!["name"] as? String)
        XCTAssertEqual("mock color", dictionary!["color"] as? String)
        XCTAssertEqual("mock brand", dictionary!["brand"] as? String)
        XCTAssertEqual(1.0, dictionary!["original_price"] as? Double)
        XCTAssertEqual(1.0, dictionary!["discount"] as? Double)
        XCTAssertEqual(1.0, dictionary!["total_price"] as? Double)
        XCTAssertEqual("€", dictionary!["currency"] as? String)
        XCTAssertEqual(["mock image"], dictionary!["images"] as? [String])
    }
}

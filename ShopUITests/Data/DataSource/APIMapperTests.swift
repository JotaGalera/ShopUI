//
//  APIMapperTests.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 15/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class APIMapperTests: XCTestCase {
    private var sut: APIMapper?
    
    override func setUp() {
        super.setUp()
        sut = APIMapperImplementation()
    }
    
    func testThatDataIsTransformedInADictionary_When_ConvertIsCalled() {
        let dataMock = """
                            {
                               "list":[
                                  {
                                     "id":1,
                                     "name":"mock name",
                                     "brand":"mock brand",
                                     "price":10,
                                     "currency":"€",
                                     "image":"mock image"
                                  }
                               ],
                               "page":"1",
                               "pageSize":"5",
                               "size":"20"
                            }
                        """.data(using: .utf8)!
        
        let dictionary = sut?.convert(data: dataMock)
        
        XCTAssertNotNil(dictionary)
        XCTAssertEqual("mock name", dictionary![0]["name"] as? String)
        XCTAssertEqual("mock brand", dictionary![0]["brand"] as? String)
        XCTAssertEqual(10, dictionary![0]["price"] as? Int)
        XCTAssertEqual("€", dictionary![0]["currency"] as? String)
        XCTAssertEqual("mock image", dictionary![0]["image"] as? String)
    }
    
    func testThatNilIsReturned_When_BadDataIsUsedByConverter() {
        let dataMock = """
                       bad data
                       """.data(using: .utf8)!
        
        let dictionary = sut?.convert(data: dataMock)
        
        XCTAssertNil(dictionary)
    }
}

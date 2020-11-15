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
    
    func testThatDataIsTransformedIntoStringDictionary_When_ConvertIsCalled(){
//        let dataMock = Data(base64Encoded: "[[name : product]]")
//        
//        let dictionary = sut?.convert(data: dataMock)
//        
//        XCTAssertEqual(dictionary.self as! [[String : String]], [["name":"product"]])
    }
    
}

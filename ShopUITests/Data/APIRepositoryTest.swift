//
//  APIRepositoryTest.swift
//  ShopUITests
//
//  Created by Javier Galera Garrido on 14/11/2020.
//
@testable import ShopUI

import Foundation
import XCTest

class APIRepositoryTest: XCTestCase {
    private var sut: APIRepository!
    
    override func setUp() {
        super.setUp()
        sut = APIRepositoryImplementation()
    }
}

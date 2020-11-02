// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
@testable import ShopUI
#elseif os(OSX)
import AppKit
#endif














class GetProductListUseCaseMock: GetProductListUseCase {

    //MARK: - execute

    var executeCallsCount = 0
    var executeCalled: Bool {
        return executeCallsCount > 0
    }
    var executeReturnValue: ProductList!
    var executeClosure: (() -> ProductList)?

    func execute() -> ProductList {
        executeCallsCount += 1
        return executeClosure.map({ $0() }) ?? executeReturnValue
    }

}
class ProductListMock: ProductList {

}
class ProductListConverterMock: ProductListConverter {

    //MARK: - convert

    var convertProductListDataCallsCount = 0
    var convertProductListDataCalled: Bool {
        return convertProductListDataCallsCount > 0
    }
    var convertProductListDataReceivedProductListData: [[String:String]]?
    var convertProductListDataReceivedInvocations: [[[String:String]]] = []
    var convertProductListDataReturnValue: ProductList!
    var convertProductListDataClosure: (([[String:String]]) -> ProductList)?

    func convert(productListData: [[String:String]]) -> ProductList {
        convertProductListDataCallsCount += 1
        convertProductListDataReceivedProductListData = productListData
        convertProductListDataReceivedInvocations.append(productListData)
        return convertProductListDataClosure.map({ $0(productListData) }) ?? convertProductListDataReturnValue
    }

}

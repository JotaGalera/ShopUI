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














class APIRepositoryMock: APIRepository {

    //MARK: - getProductList

    var getProductListCallsCount = 0
    var getProductListCalled: Bool {
        return getProductListCallsCount > 0
    }
    var getProductListReturnValue: [[String : String]]!
    var getProductListClosure: (() -> [[String : String]])?

    func getProductList() -> [[String : String]] {
        getProductListCallsCount += 1
        return getProductListClosure.map({ $0() }) ?? getProductListReturnValue
    }

}
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

    //MARK: - getProducts

    var getProductsCallsCount = 0
    var getProductsCalled: Bool {
        return getProductsCallsCount > 0
    }
    var getProductsReturnValue: [Product]!
    var getProductsClosure: (() -> [Product])?

    func getProducts() -> [Product] {
        getProductsCallsCount += 1
        return getProductsClosure.map({ $0() }) ?? getProductsReturnValue
    }

    //MARK: - setProducts

    var setProductsProductCallsCount = 0
    var setProductsProductCalled: Bool {
        return setProductsProductCallsCount > 0
    }
    var setProductsProductReceivedProduct: Product?
    var setProductsProductReceivedInvocations: [Product] = []
    var setProductsProductClosure: ((Product) -> Void)?

    func setProducts(product: Product) {
        setProductsProductCallsCount += 1
        setProductsProductReceivedProduct = product
        setProductsProductReceivedInvocations.append(product)
        setProductsProductClosure?(product)
    }

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
class ProductListViewModelMock: ProductListViewModel {

    //MARK: - getProducts

    var getProductsCallsCount = 0
    var getProductsCalled: Bool {
        return getProductsCallsCount > 0
    }
    var getProductsReturnValue: [Product]!
    var getProductsClosure: (() -> [Product])?

    func getProducts() -> [Product] {
        getProductsCallsCount += 1
        return getProductsClosure.map({ $0() }) ?? getProductsReturnValue
    }

}

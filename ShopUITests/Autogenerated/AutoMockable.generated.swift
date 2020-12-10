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














class APIDataSourceMock: APIDataSource {

    //MARK: - getProductList

    var getProductListOnSuccessOnFailureCallsCount = 0
    var getProductListOnSuccessOnFailureCalled: Bool {
        return getProductListOnSuccessOnFailureCallsCount > 0
    }
    var getProductListOnSuccessOnFailureReceivedArguments: (onSuccess: (Data)->(), onFailure: (String)->())?
    var getProductListOnSuccessOnFailureReceivedInvocations: [(onSuccess: (Data)->(), onFailure: (String)->())] = []
    var getProductListOnSuccessOnFailureClosure: ((@escaping (Data)->(), @escaping (String)->()) -> Void)?

    func getProductList(onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->()) {
        getProductListOnSuccessOnFailureCallsCount += 1
        getProductListOnSuccessOnFailureReceivedArguments = (onSuccess: onSuccess, onFailure: onFailure)
        getProductListOnSuccessOnFailureReceivedInvocations.append((onSuccess: onSuccess, onFailure: onFailure))
        getProductListOnSuccessOnFailureClosure?(onSuccess, onFailure)
    }

}
class APIMapperMock: APIMapper {

    //MARK: - convert

    var convertDataCallsCount = 0
    var convertDataCalled: Bool {
        return convertDataCallsCount > 0
    }
    var convertDataReceivedData: Data?
    var convertDataReceivedInvocations: [Data] = []
    var convertDataReturnValue: [[String:Any]]?
    var convertDataClosure: ((Data) -> [[String:Any]]?)?

    func convert(data: Data) -> [[String:Any]]? {
        convertDataCallsCount += 1
        convertDataReceivedData = data
        convertDataReceivedInvocations.append(data)
        return convertDataClosure.map({ $0(data) }) ?? convertDataReturnValue
    }

}
class APIRepositoryMock: APIRepository {

    //MARK: - getProductList

    var getProductListOnSuccessOnFailureCallsCount = 0
    var getProductListOnSuccessOnFailureCalled: Bool {
        return getProductListOnSuccessOnFailureCallsCount > 0
    }
    var getProductListOnSuccessOnFailureReceivedArguments: (onSuccess: ([[String : Any]])->(), onFailure: (String)->())?
    var getProductListOnSuccessOnFailureReceivedInvocations: [(onSuccess: ([[String : Any]])->(), onFailure: (String)->())] = []
    var getProductListOnSuccessOnFailureClosure: ((@escaping ([[String : Any]])->(), @escaping (String)->()) -> Void)?

    func getProductList(onSuccess: @escaping ([[String : Any]])->(), onFailure: @escaping (String)->()) {
        getProductListOnSuccessOnFailureCallsCount += 1
        getProductListOnSuccessOnFailureReceivedArguments = (onSuccess: onSuccess, onFailure: onFailure)
        getProductListOnSuccessOnFailureReceivedInvocations.append((onSuccess: onSuccess, onFailure: onFailure))
        getProductListOnSuccessOnFailureClosure?(onSuccess, onFailure)
    }

}
class GetProductListUseCaseMock: GetProductListUseCase {

    //MARK: - execute

    var executeOnSuccessOnFailureCallsCount = 0
    var executeOnSuccessOnFailureCalled: Bool {
        return executeOnSuccessOnFailureCallsCount > 0
    }
    var executeOnSuccessOnFailureReceivedArguments: (onSuccess: (ProductList)->(), onFailure: (String)->())?
    var executeOnSuccessOnFailureReceivedInvocations: [(onSuccess: (ProductList)->(), onFailure: (String)->())] = []
    var executeOnSuccessOnFailureClosure: ((@escaping (ProductList)->(), @escaping (String)->()) -> Void)?

    func execute(onSuccess: @escaping (ProductList)->(), onFailure: @escaping (String)->()) {
        executeOnSuccessOnFailureCallsCount += 1
        executeOnSuccessOnFailureReceivedArguments = (onSuccess: onSuccess, onFailure: onFailure)
        executeOnSuccessOnFailureReceivedInvocations.append((onSuccess: onSuccess, onFailure: onFailure))
        executeOnSuccessOnFailureClosure?(onSuccess, onFailure)
    }

}
class ProductConverterMock: ProductConverter {

    //MARK: - convert

    var convertDataCallsCount = 0
    var convertDataCalled: Bool {
        return convertDataCallsCount > 0
    }
    var convertDataReceivedData: [String:Any]?
    var convertDataReceivedInvocations: [[String:Any]] = []
    var convertDataReturnValue: Product!
    var convertDataClosure: (([String:Any]) -> Product)?

    func convert(data: [String:Any]) -> Product {
        convertDataCallsCount += 1
        convertDataReceivedData = data
        convertDataReceivedInvocations.append(data)
        return convertDataClosure.map({ $0(data) }) ?? convertDataReturnValue
    }

}
class ProductDetailViewModelMock: ProductDetailViewModel {

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

    //MARK: - getImageData

    var getImageDataCallsCount = 0
    var getImageDataCalled: Bool {
        return getImageDataCallsCount > 0
    }
    var getImageDataClosure: (() -> Void)?

    func getImageData() {
        getImageDataCallsCount += 1
        getImageDataClosure?()
    }

}
class ProductListConverterMock: ProductListConverter {

    //MARK: - convert

    var convertProductListDataCallsCount = 0
    var convertProductListDataCalled: Bool {
        return convertProductListDataCallsCount > 0
    }
    var convertProductListDataReceivedProductListData: [[String:Any]]?
    var convertProductListDataReceivedInvocations: [[[String:Any]]] = []
    var convertProductListDataReturnValue: ProductList?
    var convertProductListDataClosure: (([[String:Any]]) -> ProductList?)?

    func convert(productListData: [[String:Any]]) -> ProductList? {
        convertProductListDataCallsCount += 1
        convertProductListDataReceivedProductListData = productListData
        convertProductListDataReceivedInvocations.append(productListData)
        return convertProductListDataClosure.map({ $0(productListData) }) ?? convertProductListDataReturnValue
    }

}
class ProductListViewModelMock: ProductListViewModel {

    //MARK: - getProductList

    var getProductListCallsCount = 0
    var getProductListCalled: Bool {
        return getProductListCallsCount > 0
    }
    var getProductListClosure: (() -> Void)?

    func getProductList() {
        getProductListCallsCount += 1
        getProductListClosure?()
    }

    //MARK: - getRequestDataError

    var getRequestDataErrorCallsCount = 0
    var getRequestDataErrorCalled: Bool {
        return getRequestDataErrorCallsCount > 0
    }
    var getRequestDataErrorReturnValue: String!
    var getRequestDataErrorClosure: (() -> String)?

    func getRequestDataError() -> String {
        getRequestDataErrorCallsCount += 1
        return getRequestDataErrorClosure.map({ $0() }) ?? getRequestDataErrorReturnValue
    }

    //MARK: - getImageData

    var getImageDataCallsCount = 0
    var getImageDataCalled: Bool {
        return getImageDataCallsCount > 0
    }
    var getImageDataClosure: (() -> Void)?

    func getImageData() {
        getImageDataCallsCount += 1
        getImageDataClosure?()
    }

}

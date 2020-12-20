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

    //MARK: - getProductDetails

    var getProductDetailsProductIdOnSuccessOnFailureCallsCount = 0
    var getProductDetailsProductIdOnSuccessOnFailureCalled: Bool {
        return getProductDetailsProductIdOnSuccessOnFailureCallsCount > 0
    }
    var getProductDetailsProductIdOnSuccessOnFailureReceivedArguments: (product_id: Int, onSuccess: (Data)->(), onFailure: (String)->())?
    var getProductDetailsProductIdOnSuccessOnFailureReceivedInvocations: [(product_id: Int, onSuccess: (Data)->(), onFailure: (String)->())] = []
    var getProductDetailsProductIdOnSuccessOnFailureClosure: ((Int, @escaping (Data)->(), @escaping (String)->()) -> Void)?

    func getProductDetails(product_id: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->()) {
        getProductDetailsProductIdOnSuccessOnFailureCallsCount += 1
        getProductDetailsProductIdOnSuccessOnFailureReceivedArguments = (product_id: product_id, onSuccess: onSuccess, onFailure: onFailure)
        getProductDetailsProductIdOnSuccessOnFailureReceivedInvocations.append((product_id: product_id, onSuccess: onSuccess, onFailure: onFailure))
        getProductDetailsProductIdOnSuccessOnFailureClosure?(product_id, onSuccess, onFailure)
    }

}
class APIDetailsMapperMock: APIDetailsMapper {

    //MARK: - convert

    var convertDataCallsCount = 0
    var convertDataCalled: Bool {
        return convertDataCallsCount > 0
    }
    var convertDataReceivedData: Data?
    var convertDataReceivedInvocations: [Data] = []
    var convertDataReturnValue: [String:Any]?
    var convertDataClosure: ((Data) -> [String:Any]?)?

    func convert(data: Data) -> [String:Any]? {
        convertDataCallsCount += 1
        convertDataReceivedData = data
        convertDataReceivedInvocations.append(data)
        return convertDataClosure.map({ $0(data) }) ?? convertDataReturnValue
    }

}
class APIListMapperMock: APIListMapper {

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

    //MARK: - getProductDetails

    var getProductDetailsProductIdOnSuccessOnFailureCallsCount = 0
    var getProductDetailsProductIdOnSuccessOnFailureCalled: Bool {
        return getProductDetailsProductIdOnSuccessOnFailureCallsCount > 0
    }
    var getProductDetailsProductIdOnSuccessOnFailureReceivedArguments: (product_id: Int, onSuccess: ([String : Any])->(), onFailure: (String)->())?
    var getProductDetailsProductIdOnSuccessOnFailureReceivedInvocations: [(product_id: Int, onSuccess: ([String : Any])->(), onFailure: (String)->())] = []
    var getProductDetailsProductIdOnSuccessOnFailureClosure: ((Int, @escaping ([String : Any])->(), @escaping (String)->()) -> Void)?

    func getProductDetails(product_id: Int, onSuccess: @escaping ([String : Any])->(), onFailure: @escaping (String)->()) {
        getProductDetailsProductIdOnSuccessOnFailureCallsCount += 1
        getProductDetailsProductIdOnSuccessOnFailureReceivedArguments = (product_id: product_id, onSuccess: onSuccess, onFailure: onFailure)
        getProductDetailsProductIdOnSuccessOnFailureReceivedInvocations.append((product_id: product_id, onSuccess: onSuccess, onFailure: onFailure))
        getProductDetailsProductIdOnSuccessOnFailureClosure?(product_id, onSuccess, onFailure)
    }

}
class GetProductDetailsUseCaseMock: GetProductDetailsUseCase {

    //MARK: - execute

    var executeProductIdOnSuccessOnFailureCallsCount = 0
    var executeProductIdOnSuccessOnFailureCalled: Bool {
        return executeProductIdOnSuccessOnFailureCallsCount > 0
    }
    var executeProductIdOnSuccessOnFailureReceivedArguments: (product_id: Int, onSuccess: (Product)->(), onFailure: (String)->())?
    var executeProductIdOnSuccessOnFailureReceivedInvocations: [(product_id: Int, onSuccess: (Product)->(), onFailure: (String)->())] = []
    var executeProductIdOnSuccessOnFailureClosure: ((Int, @escaping (Product)->(), @escaping (String)->()) -> Void)?

    func execute(product_id: Int, onSuccess: @escaping (Product)->(), onFailure: @escaping (String)->()) {
        executeProductIdOnSuccessOnFailureCallsCount += 1
        executeProductIdOnSuccessOnFailureReceivedArguments = (product_id: product_id, onSuccess: onSuccess, onFailure: onFailure)
        executeProductIdOnSuccessOnFailureReceivedInvocations.append((product_id: product_id, onSuccess: onSuccess, onFailure: onFailure))
        executeProductIdOnSuccessOnFailureClosure?(product_id, onSuccess, onFailure)
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
class ProductDetailsConfiguratorMock: ProductDetailsConfigurator {

    //MARK: - configure

    var configureCallsCount = 0
    var configureCalled: Bool {
        return configureCallsCount > 0
    }
    var configureReturnValue: GetProductDetailsUseCase!
    var configureClosure: (() -> GetProductDetailsUseCase)?

    func configure() -> GetProductDetailsUseCase {
        configureCallsCount += 1
        return configureClosure.map({ $0() }) ?? configureReturnValue
    }

}
class ProductDetailsViewModelMock: ProductDetailsViewModel {

    //MARK: - getProductDetails

    var getProductDetailsProductIdCallsCount = 0
    var getProductDetailsProductIdCalled: Bool {
        return getProductDetailsProductIdCallsCount > 0
    }
    var getProductDetailsProductIdReceivedProduct_id: Int?
    var getProductDetailsProductIdReceivedInvocations: [Int] = []
    var getProductDetailsProductIdClosure: ((Int) -> Void)?

    func getProductDetails(product_id: Int) {
        getProductDetailsProductIdCallsCount += 1
        getProductDetailsProductIdReceivedProduct_id = product_id
        getProductDetailsProductIdReceivedInvocations.append(product_id)
        getProductDetailsProductIdClosure?(product_id)
    }

    //MARK: - getProductName

    var getProductNameCallsCount = 0
    var getProductNameCalled: Bool {
        return getProductNameCallsCount > 0
    }
    var getProductNameReturnValue: String!
    var getProductNameClosure: (() -> String)?

    func getProductName() -> String {
        getProductNameCallsCount += 1
        return getProductNameClosure.map({ $0() }) ?? getProductNameReturnValue
    }

    //MARK: - getProductBrand

    var getProductBrandCallsCount = 0
    var getProductBrandCalled: Bool {
        return getProductBrandCallsCount > 0
    }
    var getProductBrandReturnValue: String!
    var getProductBrandClosure: (() -> String)?

    func getProductBrand() -> String {
        getProductBrandCallsCount += 1
        return getProductBrandClosure.map({ $0() }) ?? getProductBrandReturnValue
    }

    //MARK: - getProductColor

    var getProductColorCallsCount = 0
    var getProductColorCalled: Bool {
        return getProductColorCallsCount > 0
    }
    var getProductColorReturnValue: String!
    var getProductColorClosure: (() -> String)?

    func getProductColor() -> String {
        getProductColorCallsCount += 1
        return getProductColorClosure.map({ $0() }) ?? getProductColorReturnValue
    }

    //MARK: - getProductCurrency

    var getProductCurrencyCallsCount = 0
    var getProductCurrencyCalled: Bool {
        return getProductCurrencyCallsCount > 0
    }
    var getProductCurrencyReturnValue: String!
    var getProductCurrencyClosure: (() -> String)?

    func getProductCurrency() -> String {
        getProductCurrencyCallsCount += 1
        return getProductCurrencyClosure.map({ $0() }) ?? getProductCurrencyReturnValue
    }

    //MARK: - getProductOriginalPrice

    var getProductOriginalPriceCallsCount = 0
    var getProductOriginalPriceCalled: Bool {
        return getProductOriginalPriceCallsCount > 0
    }
    var getProductOriginalPriceReturnValue: String!
    var getProductOriginalPriceClosure: (() -> String)?

    func getProductOriginalPrice() -> String {
        getProductOriginalPriceCallsCount += 1
        return getProductOriginalPriceClosure.map({ $0() }) ?? getProductOriginalPriceReturnValue
    }

    //MARK: - getProductDiscountPrice

    var getProductDiscountPriceCallsCount = 0
    var getProductDiscountPriceCalled: Bool {
        return getProductDiscountPriceCallsCount > 0
    }
    var getProductDiscountPriceReturnValue: String!
    var getProductDiscountPriceClosure: (() -> String)?

    func getProductDiscountPrice() -> String {
        getProductDiscountPriceCallsCount += 1
        return getProductDiscountPriceClosure.map({ $0() }) ?? getProductDiscountPriceReturnValue
    }

    //MARK: - getProductTotalPrice

    var getProductTotalPriceCallsCount = 0
    var getProductTotalPriceCalled: Bool {
        return getProductTotalPriceCallsCount > 0
    }
    var getProductTotalPriceReturnValue: String!
    var getProductTotalPriceClosure: (() -> String)?

    func getProductTotalPrice() -> String {
        getProductTotalPriceCallsCount += 1
        return getProductTotalPriceClosure.map({ $0() }) ?? getProductTotalPriceReturnValue
    }

    //MARK: - getProductDetailsImages

    var getProductDetailsImagesCallsCount = 0
    var getProductDetailsImagesCalled: Bool {
        return getProductDetailsImagesCallsCount > 0
    }
    var getProductDetailsImagesReturnValue: Data?
    var getProductDetailsImagesClosure: (() -> Data?)?

    func getProductDetailsImages() -> Data? {
        getProductDetailsImagesCallsCount += 1
        return getProductDetailsImagesClosure.map({ $0() }) ?? getProductDetailsImagesReturnValue
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

    //MARK: - getProductIndex

    var getProductIndexCallsCount = 0
    var getProductIndexCalled: Bool {
        return getProductIndexCallsCount > 0
    }
    var getProductIndexReceivedProduct: Product?
    var getProductIndexReceivedInvocations: [Product] = []
    var getProductIndexReturnValue: Int!
    var getProductIndexClosure: ((Product) -> Int)?

    func getProductIndex(_ product: Product) -> Int {
        getProductIndexCallsCount += 1
        getProductIndexReceivedProduct = product
        getProductIndexReceivedInvocations.append(product)
        return getProductIndexClosure.map({ $0(product) }) ?? getProductIndexReturnValue
    }

}
class ProductListConfiguratorMock: ProductListConfigurator {

    //MARK: - configure

    var configureCallsCount = 0
    var configureCalled: Bool {
        return configureCallsCount > 0
    }
    var configureReturnValue: GetProductListUseCase!
    var configureClosure: (() -> GetProductListUseCase)?

    func configure() -> GetProductListUseCase {
        configureCallsCount += 1
        return configureClosure.map({ $0() }) ?? configureReturnValue
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

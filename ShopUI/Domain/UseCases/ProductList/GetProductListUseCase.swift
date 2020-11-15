//
//  getProductListUseCase.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 31/10/2020.
//

import Foundation

protocol GetProductListUseCase: AutoMockable {
    func execute(onSuccess: @escaping (ProductList)->(), onFailure: @escaping (String)->())
}

class GetProductListUseCaseImplementation: GetProductListUseCase {
    private let converter: ProductListConverter
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation(), converter: ProductListConverter = ProductListConverterImplementation()) {
        self.repository = repository
        self.converter = converter
    }
    
    func execute(onSuccess: @escaping (ProductList)->(), onFailure: @escaping (String)->()) {
        repository.getProductList(onSuccess: { response in
            guard let productList = self.converter.convert(productListData: response) else { return }
            onSuccess(productList)
        }, onFailure: { error in
            onFailure(error)
        })
    }
}

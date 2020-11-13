//
//  getProductListUseCase.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 31/10/2020.
//

import Foundation

protocol GetProductListUseCase: AutoMockable {
    func execute() -> ProductList
}

class GetProductListUseCaseImplementation: GetProductListUseCase {
    
    private let converter: ProductListConverter
    private let repository: APIRepository
    
    init(repository: APIRepository = APIRepositoryImplementation(), converter: ProductListConverter = ProductListConverterImplementation()) {
        self.repository = repository
        self.converter = converter
    }
    
    func execute() -> ProductList {
        let productListMocked = repository.getProductList()
        let productListReturned = converter.convert(productListData: productListMocked)
        
        return productListReturned
    }
}

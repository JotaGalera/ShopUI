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
    private var productListMocked = [["ProductName": "Adidas originals trainers","size":"42"]]
    private let converter: ProductListConverter
    
    init(converter: ProductListConverter = ProductListConverterImplementation()) {
        self.converter = converter
    }
    
    func execute() -> ProductList {
        let productListReturned = converter.convert(productListData: productListMocked)
        
        return productListReturned
    }
}

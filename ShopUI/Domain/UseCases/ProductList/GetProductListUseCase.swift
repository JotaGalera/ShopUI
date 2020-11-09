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
    private var productListMocked = [
        ["ProductName": "Trainers","brand":"Adidas Originals","price":"40","currency":"€","image":"image"],
        ["ProductName": "T-Shirt","brand":"Adidas","price":"80","currency":"€","image":"image"],
        ["ProductName": "Sweat","brand":"Reebok","price":"100","currency":"€","image":"image"]
    ]
    private let converter: ProductListConverter
    
    init(converter: ProductListConverter = ProductListConverterImplementation()) {
        self.converter = converter
    }
    
    func execute() -> ProductList {
        let productListReturned = converter.convert(productListData: productListMocked)
        
        return productListReturned
    }
}

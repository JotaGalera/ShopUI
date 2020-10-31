//
//  getProductListUseCase.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 31/10/2020.
//

import Foundation

protocol GetProductListUseCase: AutoMockable {
    func execute() -> [String:String]
}

class GetProductListUseCaseImplementation: GetProductListUseCase {
    private var productListMocked = ["ProductName": "Adidas originals trainers","size":"42"]
    
    func execute() -> [String:String] {
        return productListMocked
    }
}

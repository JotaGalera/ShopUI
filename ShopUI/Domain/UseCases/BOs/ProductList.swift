//
//  ProductList.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/11/2020.
//

import Foundation

protocol ProductList: AutoMockable {}

class ProductListImplementation: ProductList {
    var arrayProduct: [Product] = []
}

extension ProductListImplementation: Equatable {
    static func == (lhs: ProductListImplementation, rhs: ProductListImplementation) -> Bool {
        guard lhs.arrayProduct == rhs.arrayProduct else { return false }
       
        for index in 0..<lhs.arrayProduct.count {
            if lhs.arrayProduct[index] != rhs.arrayProduct[index]{
                return false
            }
        }
        
        return true
    }
}

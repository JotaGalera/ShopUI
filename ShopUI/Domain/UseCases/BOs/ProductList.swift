//
//  ProductList.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/11/2020.
//

import Foundation

protocol ProductList: AutoMockable {}

class ProductListImplementation: ProductList {
    var arrayProduct: [Product]?
}

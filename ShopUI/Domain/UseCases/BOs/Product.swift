//
//  Product.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/11/2020.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    
    var name: String
    var brand: String
    var price: Int
    var currency: String
    var image: String
    var imageData: Data?
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name &&
                        lhs.brand == rhs.brand &&
                        lhs.price == rhs.price &&
                        lhs.currency == rhs.currency &&
                        lhs.image == rhs.image
    }
}

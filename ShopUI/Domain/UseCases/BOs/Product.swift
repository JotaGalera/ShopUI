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
    var color: String
    var brand: String
    var price: Double
    var original_price: Double
    var discount: Double
    var total_price: Double
    var currency: String
    var image: String
    var detailsImages: [String]
    var imageData: Data?
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name &&
                lhs.color == rhs.color &&
                lhs.brand == rhs.brand &&
                lhs.price == rhs.price &&
                lhs.original_price == rhs.original_price &&
                lhs.discount == rhs.discount &&
                lhs.total_price == rhs.total_price &&
                lhs.currency == rhs.currency &&
                lhs.image == rhs.image &&
                lhs.detailsImages == rhs.detailsImages
    }
}

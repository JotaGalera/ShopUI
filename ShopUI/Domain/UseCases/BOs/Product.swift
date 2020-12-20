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
    var originalPrice: Double
    var discount: Double
    var totalPrice: Double
    var currency: String
    var image: String
    var detailsImages: [String]
    var imageData: Data?
    var detailsImagesData: [Data]?
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name &&
                lhs.color == rhs.color &&
                lhs.brand == rhs.brand &&
                lhs.price == rhs.price &&
                lhs.originalPrice == rhs.originalPrice &&
                lhs.discount == rhs.discount &&
                lhs.totalPrice == rhs.totalPrice &&
                lhs.currency == rhs.currency &&
                lhs.image == rhs.image &&
                lhs.detailsImages == rhs.detailsImages
    }
}

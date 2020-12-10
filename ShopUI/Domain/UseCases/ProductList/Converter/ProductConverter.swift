//
//  ProductConverter.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 30/11/2020.
//

import Foundation

protocol ProductConverter: AutoMockable {
    func convert(data: [String:Any]) -> Product
}

class ProductConverterImplementation: ProductConverter {
    func convert(data: [String:Any]) -> Product {
        return Product(name: data["name"] as! String,
                       brand: data["brand"] as! String,
                       price: data["price"] as! Double,
                       currency: data["currency"] as! String,
                       image: data["image"] as! String)
    }
}

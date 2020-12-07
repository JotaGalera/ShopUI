//
//  ProductList.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/11/2020.
//

import Foundation

protocol ProductList: AutoMockable {
    func getProducts() -> [Product]
    func setProducts(product: Product)
    func getImageData()
}

class ProductListImplementation: ProductList {
    private var products: [Product] = []
    
    func setProducts(product: Product) {
        self.products.append(product)
    }
    
    func getProducts() -> [Product] {
        return products
    }
    
    func getImageData() {
        for index in 0..<products.count {
            guard let imageURL = URL(string: products[index].image) else {
                return
            }
            let imageData = try? Data(contentsOf: imageURL)
            products[index].imageData = imageData
        }
    }
}

extension ProductListImplementation: Equatable {
    static func == (lhs: ProductListImplementation, rhs: ProductListImplementation) -> Bool {
        guard lhs.products.count == rhs.products.count else { return false }
       
        for index in 0..<lhs.products.count {
            if lhs.products[index] != rhs.products[index]{
                return false
            }
        }
        
        return true
    }
}

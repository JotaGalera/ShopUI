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
    func removeProduct(product: Product)
    func getImageData()
    func getProductIndex(_ product: Product) -> Int
    func isProductInTheList(product: Product) -> Bool
}

class ProductListImplementation: ProductList {
    private var products: [Product] = []
    
    func setProducts(product: Product) {
        self.products.append(product)
    }
    
    func removeProduct(product: Product) {
        products.removeAll(where: {
            $0 == product
        })
    }
    
    func getProducts() -> [Product] {
        return products
    }
    
    func getProductIndex(_ product: Product) -> Int {
        guard let index = products.firstIndex(of: product) else { return 0 }
        return index
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
    
    func isProductInTheList(product: Product) -> Bool {
        return products.contains(product)
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

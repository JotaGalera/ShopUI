//
//  WishList.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 05/01/2021.
//

import Foundation

protocol WishList: AutoMockable {
    func getProducts() -> [Product]
    func setProducts(product: Product)
    func removeProduct(index: IndexSet)
    func removeProduct(product: Product)
    func isProductInTheList(product: Product) -> Bool
}

class WishListImplementation: WishList, ObservableObject {
    @Published var arrayProducts: [Product] = []
    
    func getProducts() -> [Product] {
        return arrayProducts
    }
    
    func setProducts(product: Product) {
        arrayProducts.append(product)
    }
    
    func removeProduct(index: IndexSet) {
        arrayProducts.remove(atOffsets: index)
        
    }
    
    func removeProduct(product: Product) {
        arrayProducts.removeAll(where: {
                    $0 == product
                })
    }
    
    func isProductInTheList(product: Product) -> Bool {
        return arrayProducts.contains(product)
    }
}


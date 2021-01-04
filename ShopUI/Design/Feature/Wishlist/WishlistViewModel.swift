//
//  WishlistViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 02/01/2021.
//

import Foundation

protocol WishlistViewModel: AutoMockable {
    func addToWishlist(product: Product)
    func removeToWishlist(product: Product)
    func isProductInWishlist(product: Product) -> Bool
}

class WishlistViewModelImplementation: WishlistViewModel, ObservableObject {
    @Published var list: [Product] = []
    
    func addToWishlist(product: Product) {
        list.append(product)
    }
    
    func removeToWishlist(product: Product) {
        list.removeAll(where: {
            $0 == product
        })
    }
    
    func isProductInWishlist(product: Product) -> Bool{
        return list.contains(product)
    }
    
    func remove(index: IndexSet) {
        list.remove(atOffsets: index)
    }
}

//
//  WishlistViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 02/01/2021.
//

import Foundation

protocol WishlistViewModel: AutoMockable {
    func addToWishlist(product: Product)
}

class WishlistViewModelImplementation: WishlistViewModel, ObservableObject {
    @Published var wishlist: ProductList = ProductListImplementation()
    
    func addToWishlist(product: Product) {
        wishlist.setProducts(product: product)
    }
    
    func isProductInWishlist(product: Product) -> Bool{
        return wishlist.isProductInTheList(product: product)
    }
}

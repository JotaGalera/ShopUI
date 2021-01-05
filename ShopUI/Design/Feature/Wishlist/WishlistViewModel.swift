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
    func remove(index: IndexSet)
    func isProductInWishlist(product: Product) -> Bool
}

class WishlistViewModelImplementation: WishlistViewModel, ObservableObject {
    var wishList = WishListImplementation()
    
    func addToWishlist(product: Product) {
        wishList.setProducts(product: product)
    }
    
    func removeToWishlist(product: Product) {
        wishList.removeProduct(product: product)
        updateView()
    }
    
    func remove(index: IndexSet) {
        wishList.removeProduct(index: index)
        updateView()
    }
    
    func isProductInWishlist(product: Product) -> Bool{
        return wishList.isProductInTheList(product: product)
    }
    
    private func updateView(){
        self.objectWillChange.send()
    }
}

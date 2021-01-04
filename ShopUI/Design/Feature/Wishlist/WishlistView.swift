//
//  WishlistView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 02/01/2021.
//

import SwiftUI

struct WishlistView: View {
    @StateObject var wishlistModelView: WishlistViewModelImplementation
    
    init(wishlistModelView: WishlistViewModelImplementation){
        _wishlistModelView = StateObject(wrappedValue: wishlistModelView)
    }
    
    var body: some View {
        List {
            ForEach(wishlistModelView.list) { product in
                Text("\(product.name)")
            }
            .onDelete( perform: wishlistModelView.remove)
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView(wishlistModelView: WishlistViewModelImplementation())
    }
}

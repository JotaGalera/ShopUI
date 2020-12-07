//
//  ProductDetailView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 07/12/2020.
//

import SwiftUI

struct ProductDetailView: View {
    
    let selectedProduct: Product 
    
    var body: some View {
        Text("\(selectedProduct.name)")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(selectedProduct: Product(name: "name", brand: "brand", price: 0, currency: "€", image: "image"))
    }
}

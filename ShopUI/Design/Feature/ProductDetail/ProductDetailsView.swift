//
//  ProductDetailView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 07/12/2020.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var productDetailsViewModel = ProductDetailsViewModelImplementation()
    let selectedProduct: Product 
    
    var body: some View {
        Text("\(selectedProduct.name)")
            .onAppear {
                productDetailsViewModel.getProductDetails()
            }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(selectedProduct: Product(name: "name",
                                                    color: "color",
                                                    brand: "brand",
                                                    price: 0.0,
                                                    original_price: 0.0,
                                                    discount: 0.0,
                                                    total_price: 0.0,
                                                    currency: "currency",
                                                    image: "image",
                                                    detailsImages: ["image"]))
    }
}

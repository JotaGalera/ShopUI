//
//  ProductDetailView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 07/12/2020.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var productDetailsViewModel = ProductDetailsViewModelImplementation()
    let selectedProduct: Int
    
    var body: some View {
        Text("\(productDetailsViewModel.product?.name ?? "Empty Value")")
            .onAppear {
                productDetailsViewModel.getProductDetails(product_id: selectedProduct)
            }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(selectedProduct: 1)
    }
}

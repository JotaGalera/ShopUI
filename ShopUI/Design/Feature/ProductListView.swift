//
//  ProductListView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var productListViewModel = ProductListViewModelImplementation()
    
    var productList: ProductList?
    
    var body: some View {
        List(productListViewModel.getProducts()) { product in
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("\(product.name)")
                Text("\(product.brand)")
                    .font(.subheadline)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

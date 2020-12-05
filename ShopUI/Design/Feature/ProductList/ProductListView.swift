//
//  ProductListView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var productListViewModel = ProductListViewModelImplementation()
    
    var body: some View {
        List(productListViewModel.productList.getProducts()) { product in
            let imageUrl = URL(string: product.image)!
            let imageData = try! Data(contentsOf: imageUrl)
            let image = UIImage(data: imageData)
            Image(uiImage: image!)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("\(product.name)")
                Text("\(product.brand)")
                    .font(.subheadline)
            }
            
        }
        .navigationBarTitle("Product List")
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            productListViewModel.getProductList()
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

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
        VStack {
            Text("Product List")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(Font.system(size: 40, design: .default))
            Divider()
            List(productListViewModel.productList.getProducts()) { product in
                let imageUrl = URL(string: product.image)!
                let imageData = try? Data(contentsOf: imageUrl)
                if let imageData = imageData, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 50, height: 50)
                }else{
                    Image(systemName: "photo.fill")
                }
                VStack(alignment: .leading) {
                    Text("\(product.name)")
                    Text("\(product.brand)")
                        .font(.subheadline)
                }
                
            }
            .navigationBarTitle("") //this must be empty
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                productListViewModel.getProductList()
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}

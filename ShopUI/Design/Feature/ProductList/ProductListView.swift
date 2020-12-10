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
            List{
                ForEach(productListViewModel.productList.getProducts()) { product in
                    ListCell(product: product)
                }
            }
            .navigationBarTitle("")
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

struct ListCell: View {
    var product: Product
    
    var body: some View {
        NavigationLink(destination: ProductDetailsView(selectedProduct: product)){
            HStack{
                buildImageProduct(imageData: product.imageData)
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("\(product.name)")
                    Text("\(product.brand)")
                        .font(.subheadline)
                }
            }
        }
    }
    
    func buildImageProduct(imageData: Data?) -> Image {
        if let imageData = imageData,
           let image = UIImage(data: imageData) {
            return Image(uiImage: image)
        }else{
            return Image(systemName: "photo.fill")
        }
    }
}

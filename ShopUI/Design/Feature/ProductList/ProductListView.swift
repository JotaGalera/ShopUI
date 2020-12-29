//
//  ProductListView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var productListViewModel: ProductListViewModelImplementation
    
    var body: some View {
        if productListViewModel.infoLoaded {
            VStack {
                Text("Product List")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(Font.system(size: 40, design: .default))
                Divider()
                List{
                    ForEach(productListViewModel.productList.getProducts()) { product in
                        let index = productListViewModel.productList.getProductIndex(product) + 1
                        ListCell(product: product, positionTapped: index)
                    }
                }
                .navigationBarTitle("Product List")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
            }
        } else {
            ActivityIndicator()
                .onAppear(){
                    productListViewModel.getProductList()
                }
        }
    }
    
}

struct ListCell: View {
    var product: Product
    var positionTapped: Int
    @State var isPresentedFullScreen = true
    
    var body: some View {
        NavigationLink(destination: ProductDetailsView(productDetailsViewModel: ProductDetailsViewModelImplementation(), selectedProduct: positionTapped)){
            HStack{
                buildImageProduct(imageData: product.imageData)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .frame(width: 50, height: 50)
                    
                VStack(alignment: .leading) {
                    Text("\(product.name)")
                        .font(.headline)
                    Text("\(product.brand)")
                        .font(.subheadline)
                }.padding(.leading, 8)
                .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
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

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(productListViewModel: ProductListViewModelImplementation())
    }
}

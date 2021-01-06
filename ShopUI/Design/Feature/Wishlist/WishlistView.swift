//
//  WishlistView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 02/01/2021.
//

import SwiftUI

struct WishlistView: View {
    @StateObject var wishlistVM: WishlistViewModelImplementation
    
    init(wishlistViewModel: WishlistViewModelImplementation){
        _wishlistVM = StateObject(wrappedValue: wishlistViewModel)
    }
    
    var body: some View {
        List {
            ForEach(wishlistVM.wishList.getProducts()) { product in
                let index = wishlistVM.wishList.getProductIndex(product) + 1
                WishListCell(product: product, positionTapped: index)
            }
            .onDelete( perform: wishlistVM.remove)
        }
        .environmentObject(wishlistVM)
    }
}

struct WishListCell: View {
    @EnvironmentObject var wishlistVM: WishlistViewModelImplementation
    var product: Product
    var positionTapped: Int
    
    var body: some View {
        NavigationLink( destination: ProductDetailsView(productDetailsViewModel: ProductDetailsViewModelImplementation(wishlistVM: wishlistVM), selectedProduct: positionTapped)){
            HStack{
                buildImageProduct(imageData: product.detailsImagesData![0])
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .frame(width: 50, height: 50)
                    
                VStack(alignment: .leading) {
                    Text("\(product.name)")
                        .font(.headline)
                    Text("\(product.brand)")
                        .font(.subheadline)
                }
                .padding(.leading, 8)
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

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView(wishlistViewModel: WishlistViewModelImplementation())
    }
}

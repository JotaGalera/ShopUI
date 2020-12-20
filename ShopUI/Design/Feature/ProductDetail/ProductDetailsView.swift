//
//  ProductDetailView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 07/12/2020.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let selectedProduct: Int
    
    init(productDetailsViewModel: ProductDetailsViewModelImplementation, selectedProduct: Int) {
        _productDetailsViewModel = StateObject(wrappedValue: productDetailsViewModel)
        self.selectedProduct = selectedProduct
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            buildImageProduct(imageData: productDetailsViewModel.getProductDetailsImages())
                .resizable()
                .frame(minWidth: 0,
                       maxWidth: UIScreen.screenWidth,
                       minHeight: 0,
                       maxHeight: UIScreen.screenWidth)
            Spacer()
            
            Spacer()
            Text(productDetailsViewModel.getProductName())
            Text(productDetailsViewModel.getProductBrand())
            Text(productDetailsViewModel.getProductColor())
            Text(productDetailsViewModel.getProductOriginalPrice())
            Text(productDetailsViewModel.getProductDiscountPrice())
            
            PriceSection(price: productDetailsViewModel.getProductTotalPrice(), currency: productDetailsViewModel.getProductCurrency())
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            productDetailsViewModel.getProductDetails(product_id: selectedProduct)
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

struct PriceSection: View {
    var price: String
    var currency: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("\(price) \(currency)" )
                    .font(.headline)
            }
            Text("TOTAL PLAYABLE")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        
        
        .frame(width: UIScreen.screenWidth, height: 100)
        .background(Color.black.opacity(0.1))
        .cornerRadius(25)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productDetailsViewModel: ProductDetailsViewModelImplementation(), selectedProduct: 1)
    }
}

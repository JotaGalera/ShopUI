//
//  ProductDetailView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 07/12/2020.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let selectedProduct: Int
    
    init(productDetailsViewModel: ProductDetailsViewModelImplementation, selectedProduct: Int) {
        self.productDetailsViewModel = productDetailsViewModel
        self.selectedProduct = selectedProduct
        UINavigationBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        VStack{
            buildImageProduct(imageData: productDetailsViewModel.getProductDetailsImages())
                .resizable()
                .frame(width: 300, height: 300)
            Text(productDetailsViewModel.getProductName())
            Text(productDetailsViewModel.getProductBrand())
            Text(productDetailsViewModel.getProductColor())
            Text(productDetailsViewModel.getProductOriginalPrice())
            Text(productDetailsViewModel.getProductDiscountPrice())
            Text(productDetailsViewModel.getProductTotalPrice())
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: customBackButton(presentationMode: _presentationMode))
        .navigationBarTitle("Names")
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

struct customBackButton: View {
    @Environment var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.largeTitle)
                Text("Product List")
            }.foregroundColor(.black)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productDetailsViewModel: ProductDetailsViewModelImplementation(), selectedProduct: 1)
    }
}

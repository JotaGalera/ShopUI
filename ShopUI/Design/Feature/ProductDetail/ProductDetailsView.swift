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
        ZStack {
            VStack{
                TabView {
                    ForEach(0..<3) { index in
                        buildImageProduct(imageData: productDetailsViewModel.product?.detailsImagesData?[index])
                            .resizable()
                            .frame(width: UIScreen.screenWidth,
                                   height: UIScreen.screenWidth,
                                   alignment: .center)
                    }
                }.tabViewStyle(PageTabViewStyle())
                .frame(width: UIScreen.screenWidth,
                       height: UIScreen.screenWidth+3)
                ProductDescription()
            }
        }
        .onAppear {
            productDetailsViewModel.getProductDetails(product_id: selectedProduct)
        }
        .environmentObject(productDetailsViewModel)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
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

struct ProductDescription: View {
    var body: some View {
        ZStack {
            HStack() {
                ProductInfoSection()
                Spacer()
                PriceSection()
            }
            .frame(width: UIScreen.screenWidth,
                   height: UIScreen.screenWidth - UIScreen.screenWidth/20,
                   alignment: .top)
            .background(Color.white)
            .cornerRadius(25.0)
            .shadow(color: Color.black, radius: 10, x: 0, y: 0)
        }
    }
}

struct ProductInfoSection: View {
    @EnvironmentObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(productDetailsViewModel.getProductName())")
                .padding(.bottom, 3)
            Text("\(productDetailsViewModel.getProductBrand())")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .padding(.bottom, 3)
        }
        .padding()
    }
}

struct PriceSection: View {
    @EnvironmentObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    
    var body: some View {
        VStack {
            Text("\(productDetailsViewModel.getProductCurrency()) \(productDetailsViewModel.getProductTotalPrice())" )
                .font(.headline)
                .padding(.bottom, 1)
            Text("\(productDetailsViewModel.getProductCurrency()) \(productDetailsViewModel.getProductOriginalPrice())")
                .strikethrough(color: Color.gray)
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .padding(.bottom, 1)
            Text("-\(productDetailsViewModel.getProductDiscountPrice())%")
                .font(.subheadline)
                .foregroundColor(Color.red)
                .padding(.bottom, 1)
        }
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productDetailsViewModel: ProductDetailsViewModelImplementation(), selectedProduct: 1)
    }
}

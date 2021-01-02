//
//  ProductDetailView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 07/12/2020.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    let selectedProduct: Int
    
    init(productDetailsViewModel: ProductDetailsViewModelImplementation, selectedProduct: Int) {
        _productDetailsViewModel = StateObject(wrappedValue: productDetailsViewModel)
        self.selectedProduct = selectedProduct
    }
    
    var body: some View {
        if productDetailsViewModel.infoLoaded {
            VStack {
                ProductImagesCarousel()
                ScrollView(.vertical){
                    ProductDescription()
                }
            }
            .environmentObject(productDetailsViewModel)
            .modifier(ProductDetailsViewStyle())
            
        } else {
            ActivityIndicator()
                .modifier(ProductDetailsViewStyle())
                .onAppear {
                    productDetailsViewModel.getProductDetails(product_id: selectedProduct)
                }
        }
    }
}

struct ProductDetailsViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .ignoresSafeArea(edges: .bottom)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProductImagesCarousel: View {
    @EnvironmentObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    
    var body: some View {
        TabView {
            ForEach(0..<3) { index in
                buildImageProduct(imageData: productDetailsViewModel.product?.detailsImagesData?[index])
                    .resizable()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
        .cornerRadius(25.0)
        .shadow(color: Color.black, radius: 10, x: 0, y: 0)
        
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
            VStack{
                HStack() {
                    InfoSection()
                    Spacer()
                    PriceSection()
                }
                Divider().frame(width: UIScreen.screenWidth-40)
                AboutTheProduct()
                WishlistAndAddToCartGroupButton()
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth*1.3, alignment: .top)
        }
    }
}

struct InfoSection: View {
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


struct AboutTheProduct: View {
    @State var expanded: Bool = true
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $expanded,
            content: {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                            .padding()
                    }
                }
            },
            label: {
                Text("PRODUCT INFO")
                .padding()
                .font(.subheadline)
                .foregroundColor(Color.black) }
        ).padding()
    }
}

struct WishlistAndAddToCartGroupButton: View {
    @EnvironmentObject var productDetailsViewModel: ProductDetailsViewModelImplementation
    
    var body: some View {
        HStack {
            WishlistButton()
                .modifier(CustomButtonStyle(color: .white))
                .frame(width: UIScreen.screenWidth-UIScreen.screenWidth/1.5, height: 80)
                .offset(x: 25.0)
                .onTapGesture {
                    self.productDetailsViewModel.addToWishlist()
                }
            AddToCart()
                .modifier(CustomButtonStyle(color: .black))
                .frame(width: UIScreen.screenWidth-UIScreen.screenWidth/2, height: 80)
                .offset(x: -25.0)
            
        }
    }
}

struct AddToCart: View {
    var body: some View {
        Button(action: { print("addToCart tapped") }, label: {
            Text("Add to cart")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
            Image(systemName: "cart.circle.fill" )
                .resizable()
                .foregroundColor(.white)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
        })
    }
}

struct CustomButtonStyle: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .background(color)
            .cornerRadius(25.0)
            .shadow(color: .black, radius: 5, x: 0, y: 0)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productDetailsViewModel: ProductDetailsViewModelImplementation(), selectedProduct: 1)
    }
}

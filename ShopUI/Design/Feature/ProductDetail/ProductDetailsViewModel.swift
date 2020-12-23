//
//  ProductDetailViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 10/12/2020.
//

import Foundation

protocol ProductDetailsViewModel: AutoMockable {
    func getProductDetails(product_id: Int)
    func getProductName() -> String
    func getProductBrand() -> String
    func getProductColor() -> String
    func getProductCurrency() -> String
    func getProductOriginalPrice() -> String
    func getProductDiscountPrice() -> String
    func getProductTotalPrice() -> String
    func getProductDetailsImages() -> [Data]?
    func getNumberOfDetailsImages() -> Int
}

class ProductDetailsViewModelImplementation: ProductDetailsViewModel, ObservableObject{
    private var getProductDetailsUseCase: GetProductDetailsUseCase
    private var configurator: ProductDetailsConfigurator
    @Published var product: Product?
    
    init(product: Product? = nil, configurator: ProductDetailsConfigurator = ProductDetailsConfiguratorImplementation()){
        self.product = product
        self.configurator = configurator
        self.getProductDetailsUseCase = self.configurator.configure()
    }
    
    func getProductDetails(product_id: Int) {
        _ = getProductDetailsUseCase.execute(product_id: product_id,
        onSuccess: { result in
            DispatchQueue.main.async {
                self.product = result
                self.getDetailsImages()
            }
        }, onFailure: { error in })
    }
    
    func getDetailsImages() {
        var arrayImagesData: [Data]? = []
        guard let detailsImagesCount = product?.detailsImages.count else { return }
        for index in 0..<detailsImagesCount {
            guard let detailsImage = product?.detailsImages[index],
                  let imageURL = URL(string: detailsImage)
            else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            arrayImagesData?.append(imageData)
        }
        product?.setDetailsImagesData(imagesData: arrayImagesData)
    }
    
    // MARK: - Exposing BO methods -
    
    func getProductName() -> String {
        return product?.name ?? ""
    }
    
    func getProductBrand() -> String {
        return product?.brand ?? ""
    }
    
    func getProductColor() -> String {
        return product?.color ?? ""
    }
    
    func getProductCurrency() -> String {
        return product?.currency ?? ""
    }
    
    func getProductOriginalPrice() -> String {
        guard let originalPrice = product?.originalPrice else { return "" }
        return String(originalPrice)
    }
    
    func getProductDiscountPrice() -> String {
        guard let discount = product?.discount else { return "" }
        return String(discount)
    }
    
    func getProductTotalPrice() -> String {
        guard let totalPrice = product?.totalPrice else { return "" }
        return String(totalPrice)
    }
    
    func getProductDetailsImages() -> [Data]? {
        return product?.detailsImagesData
    }
    
    func getNumberOfDetailsImages() -> Int {
        guard let imagesData = product?.detailsImagesData else { return 0 }
        return imagesData.count
    }
    
}

//
//  ProductDetailViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 10/12/2020.
//

import Foundation

protocol ProductDetailsViewModel: AutoMockable {
    func getProductDetails(product_id: Int)
}

class ProductDetailsViewModelImplementation: ProductDetailsViewModel, ObservableObject {
    private var getProductDetailsUseCase: GetProductDetailsUseCase
    private var configurator: ProductDetailsConfigurator
    @Published var product: Product?
    
    init(configurator: ProductDetailsConfigurator = ProductDetailsConfiguratorImplementation()){
        self.configurator = configurator
        self.getProductDetailsUseCase = self.configurator.configure()
    }
    
    func getProductDetails(product_id: Int) {
        _ = getProductDetailsUseCase.execute(product_id: product_id,
        onSuccess: { result in
            self.product = result
        }, onFailure: { error in })
    }
}

//
//  ProductDetailViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 10/12/2020.
//

import Foundation

protocol ProductDetailsViewModel: AutoMockable {
    func getProductDetails() 
}

class ProductDetailsViewModelImplementation: ProductDetailsViewModel, ObservableObject {
    private var getProductDetailsUseCase: GetProductDetailsUseCase
    private var configurator: ProductDetailsConfigurator
    
    init(configurator: ProductDetailsConfigurator = ProductDetailsConfiguratorImplementation()){
        self.configurator = configurator
        self.getProductDetailsUseCase = self.configurator.configure()
    }
    
    func getProductDetails() {
        _ = getProductDetailsUseCase.execute(product_id: 1,
        onSuccess: { result in
            print("tucutucu: \(result)")
        }, onFailure: { error in })
    }
}

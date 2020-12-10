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

class ProductDetailsViewModelImplementation: ProductDetailsViewModel {
    private var getProductDetailsUseCase: GetProductDetailsUseCase
    
    init(getProductDetailsUseCase: GetProductDetailsUseCase = GetProductDetailsUseCaseImplementation()){
        self.getProductDetailsUseCase = getProductDetailsUseCase
    }
    
    func getProductDetails() {
        _ = getProductDetailsUseCase.execute()
    }
}

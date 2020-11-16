//
//  ProductListViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import Foundation

protocol ProductListViewModel: AutoMockable {
    func getProductList()
}

class ProductListViewModelImplementation: ProductListViewModel, ObservableObject {
    private var getProductListUseCase: GetProductListUseCase
    @Published var productList: ProductList
    
    
    init(getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation(),
         productList: ProductList = ProductListImplementation() ){
        self.getProductListUseCase = getProductListUseCase
        self.productList = productList
    }
        
    func getProductList() {
        getProductListUseCase.execute(onSuccess: { response in
            DispatchQueue.main.async {
                self.productList = response
            }
        }, onFailure: { error in
            print("\(error)")
        })
    }
}

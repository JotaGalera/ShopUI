//
//  ProductListViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import Foundation

protocol ProductListViewModel: AutoMockable {
    func getProducts() -> [Product]
}

class ProductListViewModelImplementation: ProductListViewModel, ObservableObject {
    private var getProductListUseCase: GetProductListUseCase
    private var productList: ProductList
    
    
    init(getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation(),
         productList: ProductList = ProductListImplementation() ){
        self.getProductListUseCase = getProductListUseCase
        self.productList = productList
        DispatchQueue.main.async {
            self.getProductList()
        }
    }
    
    func getProducts() -> [Product] {
        return productList.getProducts()
    }
    
    private func getProductList() {
        getProductListUseCase.execute(onSuccess: { response in
            self.productList = response
        }, onFailure: { error in
            print("\(error)")
        })
    }
}

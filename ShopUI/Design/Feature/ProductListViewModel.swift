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
    
    init(getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation()){
        self.getProductListUseCase = getProductListUseCase
    }
    
    func getProducts() -> [Product] {
        let productList = getProductList()
        return productList.getProducts()
    }
    
    private func getProductList() -> ProductList {
        return getProductListUseCase.execute()
    }
}

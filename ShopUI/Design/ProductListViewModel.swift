//
//  ProductListViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import Foundation

protocol ProductListViewModel: AutoMockable {
    func getProductList()-> ProductList
}

class ProductListViewModelImplementation: ProductListViewModel {
    private var getProductListUseCase: GetProductListUseCase
    
    init(getProductListUseCase: GetProductListUseCase = GetProductListUseCaseImplementation()){
        self.getProductListUseCase = getProductListUseCase
    }
    
    func getProductList()-> ProductList {
        return getProductListUseCase.execute()
    }
}

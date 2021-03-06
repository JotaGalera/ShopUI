//
//  ProductListViewModel.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 03/11/2020.
//

import Foundation

protocol ProductListViewModel: AutoMockable {
    func getProductList()
    func getRequestDataError() -> String
    func getImageData()
}

class ProductListViewModelImplementation: ProductListViewModel, ObservableObject {
    private var getProductListUseCase: GetProductListUseCase
    private var configurator: ProductListConfigurator
    @Published var productList: ProductList
    @Published var infoLoaded: Bool
    var requestDataError: String = ""
    
    
    init(configurator: ProductListConfigurator = ProductListConfiguratorImplementation(),
         productList: ProductList = ProductListImplementation(),
         infoLoaded: Bool = false){
        self.configurator = configurator
        self.getProductListUseCase = self.configurator.configure()
        self.productList = productList
        self.infoLoaded = infoLoaded
    }
        
    func getProductList() {
        getProductListUseCase.execute(onSuccess: { response in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.productList = response
                self.getImageData()
                self.infoLoaded = true
            })
        }, onFailure: { error in
            self.requestDataError = error
            self.infoLoaded = true
        })
    }
    
    func getImageData() {
        self.productList.getImageData()
    }
    
    func getRequestDataError() -> String {
        return requestDataError
    }
}

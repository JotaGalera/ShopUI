//
//  ProductListConverter.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/11/2020.
//

import Foundation

protocol ProductListConverter: AutoMockable {
    func convert(productListData: [[String:Any]]) -> ProductList?
}

class ProductListConverterImplementation: ProductListConverter {
    let productConverter: ProductConverter
    
    init(productConverter: ProductConverter){
        self.productConverter = productConverter
    }
    
    func convert(productListData: [[String:Any]]) -> ProductList? {
        let productList = ProductListImplementation()
        
        for index in 0..<productListData.count{
            let product = productConverter.convert(data: productListData[index])
            productList.addProduct(product: product)
        }
        
        return productList
    }
}

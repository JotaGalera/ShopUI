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
    func convert(productListData: [[String:Any]]) -> ProductList? {
        let productList = ProductListImplementation()
        
        for index in 0..<productListData.count{
            
            let product = Product(name: productListData[index]["name"] as! String,
                                  brand: productListData[index]["brand"] as! String,
                                  price: Int(productListData[index]["price"] as! Int) ?? 0,
                                  currency: productListData[index]["currency"] as! String,
                                  image: productListData[index]["image"] as! String)
            productList.setProducts(product: product)
        }
        
        return productList
    }
}

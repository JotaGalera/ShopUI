//
//  ProductListConverter.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/11/2020.
//

import Foundation

protocol ProductListConverter: AutoMockable {
    func convert(productListData: [[String:String]])->ProductList
}

class ProductListConverterImplementation: ProductListConverter {
    func convert(productListData: [[String:String]])->ProductList {
        let productList = ProductListImplementation()
        
        for index in 0..<productListData.count{
            
            let product = Product(name: productListData[index]["ProductName"] ?? "",
                                  brand: productListData[index]["brand"] ?? "",
                                  price: Int(productListData[index]["price"] ?? "0") ?? 0,
                                  currency: productListData[index]["currency"] ?? "",
                                  image: productListData[index]["image"] ?? "")
            productList.arrayProduct.append(product)
        }
        
        return productList
    }
}

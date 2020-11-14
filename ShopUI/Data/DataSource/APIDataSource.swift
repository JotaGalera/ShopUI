//
//  APIDataSource.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Foundation

protocol APIDataSource: AutoMockable {
    func getProductList() -> [[String:String]]
}

class APIDataSourceImplementation: APIDataSource {
    private var productListMocked = [
        ["ProductName": "Trainers","brand":"Adidas Originals","price":"40","currency":"€","image":"image"],
        ["ProductName": "T-Shirt","brand":"Adidas","price":"80","currency":"€","image":"image"],
        ["ProductName": "Sweat","brand":"Reebok","price":"100","currency":"€","image":"image"]
    ]
    
    func getProductList() -> [[String:String]] {
        return productListMocked
    }
}

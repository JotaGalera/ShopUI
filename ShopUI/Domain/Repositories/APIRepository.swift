//
//  APIRepository.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Foundation

protocol APIRepository: AutoMockable {
    func getProductList() -> [[String : String]]
}

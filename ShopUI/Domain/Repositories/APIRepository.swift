//
//  APIRepository.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Foundation

protocol APIRepository: AutoMockable {
    func getProductList(onSuccess: @escaping ([[String : Any]])->(), onFailure: @escaping (String)->())
}

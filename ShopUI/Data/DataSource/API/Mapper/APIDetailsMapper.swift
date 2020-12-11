//
//  APIDetailsMapper.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 11/12/2020.
//

import Foundation

protocol APIDetailsMapper : AutoMockable {
    func convert() -> Bool
}

class APIDetailsMapperImplementation: APIDetailsMapper {
    func convert() -> Bool {
        return true
    }
}

//
//  APIDetailsMapper.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 11/12/2020.
//

import Foundation

protocol APIDetailsMapper : AutoMockable {
    func convert(data: Data) -> [String:Any]?
}

class APIDetailsMapperImplementation: APIDetailsMapper {
    func convert(data: Data) -> [String:Any]? {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [String:Any] else { return nil }
            return array
        }
        return nil
    }
}

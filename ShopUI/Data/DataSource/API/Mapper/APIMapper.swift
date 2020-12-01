//
//  APIMapper.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 15/11/2020.
//

import Foundation

protocol APIMapper : AutoMockable {
    func convert(data: Data) -> [[String:Any]]?
}

class APIMapperImplementation: APIMapper {
    func convert(data: Data) -> [[String:Any]]? {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [String:Any] else { return nil }
            guard let sizeArray = array as? [String:Any] else { return nil }
            guard let sizePageString = sizeArray["size"] as? Int else { return nil }
            guard let elements = array["list"] as? [[String:Any]] else { return nil }
            return elements
        }
        return nil
    }
}

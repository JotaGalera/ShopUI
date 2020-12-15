//
//  APIDataSource.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Alamofire
import Foundation

protocol APIDataSource: AutoMockable {
    func getProductList(onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->())
    func getProductDetails(product_id: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->())
}

class APIDataSourceImplementation: APIDataSource {
    private var endPointAPI: String
    
    init(endPointAPI: String){
        self.endPointAPI = endPointAPI
    }
    
    func getProductList(onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->()) {
        AF.request(endPointAPI).validate().responseData { response in
            switch response.result {
                case let .success(data):
                    onSuccess(data)
                case let .failure(error):
                    onFailure("\(error)")
                }
        }
    }
    
    func getProductDetails(product_id: Int, onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->()) {
        AF.request("\(endPointAPI)\(product_id)").validate().responseData { response in
            switch response.result {
                case let .success(data):
                    onSuccess(data)
                case let .failure(error):
                    onFailure("\(error)")
                }
        }
    }
}

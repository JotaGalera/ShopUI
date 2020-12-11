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
    func getProductDetails()->Bool
}

class APIDataSourceImplementation: APIDataSource {
    private var getProductListURL: String
    
    init(getProductListURL: String = APIData.getProducts){
        self.getProductListURL = getProductListURL
    }
    
    func getProductList(onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->()) {
        let url = APIData.getProducts
            
        AF.request(url).validate().responseData { response in
            switch response.result {
                case let .success(data):
                    onSuccess(data)
                case let .failure(error):
                    onFailure("\(error)")
                }
        }
    }
    
    func getProductDetails() -> Bool {
        return true
    }
}

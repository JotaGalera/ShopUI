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
}

class APIDataSourceImplementation: APIDataSource {
    private var getProductListURL: String
    private var headers: HTTPHeaders = HTTPHeaders()
    
    init(getProductListURL: String = APIData.getProducts,
         header: HTTPHeader = HTTPHeader(name: "Authorization", value: APIData.authKey)){
        self.getProductListURL = getProductListURL
        self.headers.add(header)
    }
    
    func getProductList(onSuccess: @escaping (Data)->(), onFailure: @escaping (String)->()) {
        let url = APIData.getProducts
        var header: HTTPHeaders? = HTTPHeaders()
        header?.add(HTTPHeader(name: "Authorization", value: APIData.authKey))
        
        
        AF.request(url, headers: header).validate().responseData { response in
            switch response.result {
                case let .success(data):
                    onSuccess(data)
                case let .failure(error):
                    onFailure("\(error)")
                }
        }
    }
}

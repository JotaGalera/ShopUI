//
//  APIRepositoryImplementation.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Foundation

class APIRepositoryImplementation: APIRepository {
    private var dataSource: APIDataSource
    private var mapper: APIMapper
    
    init(dataSource: APIDataSource = APIDataSourceImplementation(), mapper: APIMapper = APIMapperImplementation()){
        self.dataSource = dataSource
        self.mapper = mapper
    }

    func getProductList(onSuccess: @escaping ([[String : Any]])->(), onFailure: @escaping (String)->()) {
        dataSource.getProductList(onSuccess: { response in
            guard let dictionary = self.mapper.convert(data: response) else { return }
            onSuccess(dictionary)
        }, onFailure: { error in
            onFailure(error)
        })
    }
}

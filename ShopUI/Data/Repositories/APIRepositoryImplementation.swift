//
//  APIRepositoryImplementation.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Foundation

class APIRepositoryImplementation: APIRepository {
    private var dataSource: APIDataSource
    private var listMapper: APIListMapper
    private var detailsMapper: APIDetailsMapper
    
    init(dataSource: APIDataSource = APIDataSourceImplementation(),
         listMapper: APIListMapper = APIListMapperImplementation(),
         detailsMapper: APIDetailsMapper = APIDetailsMapperImplementation()){
        self.dataSource = dataSource
        self.listMapper = listMapper
        self.detailsMapper = detailsMapper
    }

    func getProductList(onSuccess: @escaping ([[String : Any]])->(), onFailure: @escaping (String)->()) {
        dataSource.getProductList(onSuccess: { response in
            guard let dictionary = self.listMapper.convert(data: response) else { return }
            onSuccess(dictionary)
        }, onFailure: { error in
            onFailure(error)
        })
    }
    
    func getProductDetails()->Bool {
        return dataSource.getProductDetails()
    }
}

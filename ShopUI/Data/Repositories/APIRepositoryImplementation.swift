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
    
    init(dataSource: APIDataSource,
         listMapper: APIListMapper,
         detailsMapper: APIDetailsMapper){
        self.dataSource = dataSource
        self.listMapper = listMapper
        self.detailsMapper = detailsMapper
    }

    func getProductList(onSuccess: @escaping ([[String : Any]])->(), onFailure: @escaping (String)->()) {
        dataSource.getProductList(onSuccess: { [weak self] response in
            guard let self = self, let dictionary = self.listMapper.convert(data: response) else { return }
            onSuccess(dictionary)
        }, onFailure: { error in
            onFailure(error)
        })
    }
    
    func getProductDetails(product_id: Int, onSuccess: @escaping ([String : Any])->(), onFailure: @escaping (String)->()) {
        return dataSource.getProductDetails(product_id: product_id,
        onSuccess: { [weak self] data in
            guard let self = self, let dictionary = self.detailsMapper.convert(data: data) else { return }
            onSuccess(dictionary)
        }, onFailure: { error in
            onFailure(error)
        })
    }
}

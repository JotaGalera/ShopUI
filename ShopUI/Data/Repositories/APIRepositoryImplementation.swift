//
//  APIRepositoryImplementation.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 14/11/2020.
//

import Foundation

class APIRepositoryImplementation: APIRepository {
    private var dataSource: APIDataSource
    
    init(dataSource: APIDataSource = APIDataSourceImplementation()){
        self.dataSource = dataSource
    }
    
    func getProductList() -> [[String : String]] {
        let productListMocked = dataSource.getProductList()
        
        return productListMocked
    }
}

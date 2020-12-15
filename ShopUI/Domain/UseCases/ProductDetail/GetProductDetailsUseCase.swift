//
//  getProductDetailsUseCase.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 10/12/2020.
//

import Foundation

protocol GetProductDetailsUseCase: AutoMockable {
    func execute(product_id: Int, onSuccess: @escaping ([String : Any])->(), onFailure: @escaping (String)->())
}

class GetProductDetailsUseCaseImplementation: GetProductDetailsUseCase {
    private var repository: APIRepository
    
    init(repository: APIRepository){
        self.repository = repository
    }
    
    func execute(product_id: Int, onSuccess: @escaping ([String : Any])->(), onFailure: @escaping (String)->()) {
        return repository.getProductDetails(product_id: product_id, onSuccess: onSuccess, onFailure: onFailure)
    }
}

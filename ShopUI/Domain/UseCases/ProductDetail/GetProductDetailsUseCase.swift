//
//  getProductDetailsUseCase.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 10/12/2020.
//

import Foundation

protocol GetProductDetailsUseCase: AutoMockable {
    func execute()->Bool
}

class GetProductDetailsUseCaseImplementation: GetProductDetailsUseCase {
    private var repository: APIRepository
    
    init(repository: APIRepository){
        self.repository = repository
    }
    
    func execute() -> Bool {
        return repository.getProductDetails()
    }
}

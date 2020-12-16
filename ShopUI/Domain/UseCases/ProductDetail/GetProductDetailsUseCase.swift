//
//  getProductDetailsUseCase.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 10/12/2020.
//

import Foundation

protocol GetProductDetailsUseCase: AutoMockable {
    func execute(product_id: Int, onSuccess: @escaping (Product)->(), onFailure: @escaping (String)->())
}

class GetProductDetailsUseCaseImplementation: GetProductDetailsUseCase {
    private var repository: APIRepository
    private var converter: ProductConverter
    
    init(repository: APIRepository, converter: ProductConverter){
        self.repository = repository
        self.converter = converter
    }
    
    func execute(product_id: Int, onSuccess: @escaping (Product)->(), onFailure: @escaping (String)->()) {
        return repository.getProductDetails(product_id: product_id,
                                            onSuccess: { [weak self] result in
                                                guard let self = self else { return }
                                                let product = self.converter.convert(data: result)
                                                onSuccess(product)
                                            }, onFailure: onFailure)
    }
}

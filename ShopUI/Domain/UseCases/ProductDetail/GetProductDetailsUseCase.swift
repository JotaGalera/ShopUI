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
    func execute() -> Bool {
        return true
    }
}

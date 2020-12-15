//
//  ProductListConfigurator.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 11/12/2020.
//

import Foundation

protocol ProductListConfigurator: AutoMockable {
    func configure() -> GetProductListUseCase
}

class ProductListConfiguratorImplementation: ProductListConfigurator {
    func configure() -> GetProductListUseCase {
        let dataSource = APIDataSourceImplementation(endPointAPI: APIData.getProducts)
        let listMapper = APIListMapperImplementation()
        let detailMapper = APIDetailsMapperImplementation()
        let repository = APIRepositoryImplementation(dataSource: dataSource, listMapper: listMapper, detailsMapper: detailMapper)
        let productConverter = ProductConverterImplementation()
        let productListConverter = ProductListConverterImplementation(productConverter: productConverter)
        return GetProductListUseCaseImplementation(repository: repository, converter: productListConverter)
    }
}

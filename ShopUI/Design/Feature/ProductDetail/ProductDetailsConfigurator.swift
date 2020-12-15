//
//  ProductDetailsConfigurator.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 11/12/2020.
//
import Foundation

protocol ProductDetailsConfigurator: AutoMockable {
    func configure() -> GetProductDetailsUseCase
}

class ProductDetailsConfiguratorImplementation: ProductDetailsConfigurator {
    func configure() -> GetProductDetailsUseCase {
        let dataSource = APIDataSourceImplementation(endPointAPI: APIData.getDetails)
        let listMapper = APIListMapperImplementation()
        let detailMapper = APIDetailsMapperImplementation()
        let repository = APIRepositoryImplementation(dataSource: dataSource, listMapper: listMapper, detailsMapper: detailMapper)
        return GetProductDetailsUseCaseImplementation(repository: repository)
    }
}

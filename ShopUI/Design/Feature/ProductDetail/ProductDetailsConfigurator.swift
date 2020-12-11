import Foundation

protocol ProductDetailsConfigurator: AutoMockable {}

class ProductDetailsConfiguratorImplementation: ProductDetailsConfigurator {
    func configure() -> GetProductDetailsUseCase {
        let dataSource = APIDataSourceImplementation(getProductListURL: APIData.getDetails)
        let listMapper = APIListMapperImplementation()
        let detailMapper = APIDetailsMapperImplementation()
        let repository = APIRepositoryImplementation(dataSource: dataSource, listMapper: listMapper, detailsMapper: detailMapper)
        return GetProductDetailsUseCaseImplementation(repository: repository)
    }
}

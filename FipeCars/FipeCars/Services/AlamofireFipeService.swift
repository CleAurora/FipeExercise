//
//  AlamofireFipeService.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

import Alamofire

final class AlamofireFipeService: BrandsService, ModelsService, YearsService, FipeService {
    private let baseURL = "https://parallelum.com.br/fipe/api/v1/carros"
    static let shared: BrandsService & ModelsService & YearsService & FipeService = AlamofireFipeService()

    private init() { }

    func getBrands(then handler: @escaping (Result<[Brand], Error>) -> Void) {
        makeRequest(withEndpoint: "marcas", then: handler)
    }

    func getModels(from brand: Brand, then handler: @escaping (Result<CarModel, Error>) -> Void) {
        makeRequest(withEndpoint: "marcas/\(brand.code)/modelos", then: handler)
    }

    func getYears(from brand: Brand, with model: Model, then handler: @escaping (Result<[Year], Error>) -> Void) {
        makeRequest(withEndpoint: "marcas/\(brand.code)/modelos/\(model.code)/anos", then: handler)
    }

    func getFipe(from brand: Brand, with model: Model, on year: Year, then handler: @escaping (Result<Fipe, Error>) -> Void) {
        makeRequest(withEndpoint: "marcas/\(brand.code)/modelos/\(model.code)/anos/\(year.code)", then: handler)
    }

    private func makeRequest<Output: Decodable>(withEndpoint endpoint: String, then handler: @escaping (Result<Output, Error>) -> Void) {
        let url = "\(baseURL)/\(endpoint)"

        AF.request(url).responseDecodable(of: Output.self) { response in
            do {
                let result = try response.result.get()

                handler(.success(result))
            } catch {
                handler(.failure(error))
            }
        }
    }
}

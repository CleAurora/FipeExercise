//
//  FipeService.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

typealias Brand = KeyValue<String>

protocol BrandsService {
    func getBrands(then handler: @escaping (Result<[Brand], Error>) -> Void)
}

protocol ModelsService {
    func getModels(from brand: Brand, then handler: @escaping (Result<CarModel, Error>) -> Void)
}

protocol YearsService {
    func getYears(from brand: Brand, with model: Model, then handler: @escaping (Result<[Year], Error>) -> Void)
}

protocol FipeService {
    func getFipe(from brand: Brand, with model: Model, on year: Year, then handler: @escaping (Result<Fipe, Error>) -> Void)
}

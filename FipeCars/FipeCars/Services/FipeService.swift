//
//  FipeService.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

typealias Brand = KeyValue

protocol FipeService {
    func getBrands(then handler: @escaping (Result<[Brand], Error>) -> Void)
}

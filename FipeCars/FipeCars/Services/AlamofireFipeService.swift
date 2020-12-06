//
//  AlamofireFipeService.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

import Alamofire

final class AlamofireFipeService: FipeService {
    private let baseURL = "https://parallelum.com.br/fipe/api/v1/carros"
    static let shared = AlamofireFipeService()

    private init() { }

    func getBrands(then handler: @escaping (Result<[Brand], Error>) -> Void) {
        makeRequest(withEndpoint: "marcas", then: handler)
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

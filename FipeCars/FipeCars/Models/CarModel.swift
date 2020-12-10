//
//  CarModel.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

typealias Model = KeyValue<Int>
typealias Year = KeyValue<String>

struct CarModel: Decodable {
    let models: [Model]
    let years: [Year]

    init() {
        models = []
        years = []
    }

    enum CodingKeys: String, CodingKey {
        case models = "modelos"
        case years = "anos"
    }
}

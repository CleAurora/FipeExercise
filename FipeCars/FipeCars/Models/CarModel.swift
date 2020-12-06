//
//  CarModel.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

struct CarModel: Decodable {
    let models: [KeyValue]

    enum CodingKeys: String, CodingKey {
        case models = "modelos"
    }
}

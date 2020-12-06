//
//  KeyValue.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

struct KeyValue: Decodable {
    let name: String
    let code: String

    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case code = "codigo"
    }
}

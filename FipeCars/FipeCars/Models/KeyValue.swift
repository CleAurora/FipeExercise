//
//  KeyValue.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

struct KeyValue<Value: Decodable>: Decodable {
    let name: String
    let code: Value

    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case code = "codigo"
    }
}

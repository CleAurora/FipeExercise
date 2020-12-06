//
//  Fipe.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

struct Fipe: Encodable {
    let value: String
    let brand: String
    let model: String
    let year: Int
    let fuel: String
    let fipeCode: String
    let month: String
    let vehicleType: Int
    let fuelType: String

    enum CodingKeys: String, CodingKey {
        case value = "Valor"
        case brand = "Marca"
        case model = "Modelo"
        case year = "AnoModelo"
        case fuel = "Combustivel"
        case fipeCode = "CodigoFipe"
        case month = "MesReferencia"
        case vehicleType = "TipoVeiculo"
        case fuelType = "SiglaCombustivel"
    }
}

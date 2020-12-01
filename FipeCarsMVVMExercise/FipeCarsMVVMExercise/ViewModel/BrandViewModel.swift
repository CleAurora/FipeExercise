//
//  BrandViewModel.swift
//  FipeCarsMVVMExercise
//
//  Created by Cleís Aurora Pereira on 30/11/20.
//

import Foundation
import Alamofire

class BrandViewModel {

    let apiManager = APIManager()
    var brandArray = [Brand]()

    func getCarsInfoWithMVVM(completion: () -> Void ) {

        apiManager.request(url: "https://parallelum.com.br/fipe/api/v1/carros/marcas") { (json, jsonarray, errorStr) in

            if json != nil {

                print("json dicionario")
            }

            if jsonarray != nil {
                for item in jsonarray! {
                    let object = Brand(fromDictionary: item)
                    self.brandArray.append(object)
                }
                print("json com array de dicionario ")
            }
        }
    }
}


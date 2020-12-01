//
//  Brand.swift
//  FipeCarsMVVMExercise
//
//  Created by Cleís Aurora Pereira on 30/11/20.
//

import Foundation

class BaseClass: NSObject {
    var name: String!
    var id: String!

    init(fromDictionary dictionary: [String: Any]) {
        self.name = dictionary["nome"] as? String
        self.id = dictionary["codigo"] as? String

        if id == nil {
            if let intId = dictionary["codigo"] as? Int {
                id = "\(intId)"
            }
        }
    }
}

//
//  BrandViewModel.swift
//  FipeCarsMVVMExercise
//
//  Created by Cleís Aurora Pereira on 30/11/20.
//

import Foundation
import Alamofire

class APIManager {

    typealias completion <T> =  (_ result: T, _ failure: Bool) -> Void

    func request(url: String, completion: @escaping (_ json: [String: Any]?, _ jsonArray: [[String: Any]]?, _ error: String?) -> Void) {
        AF.request(url).responseJSON { response in
            guard let jsonObj = response.value else {
                completion(nil, nil, "")
                return
            }

        if let json = jsonObj as? [String: Any] {
                if let jsn = json["error"] as? [String:Any] {
                    completion(nil, nil, "")
                } else {
                    completion(json, nil, nil)
                }
            } else if let jsonArray = jsonObj as? [[String: Any]] {
                completion(nil, jsonArray, nil)
            } else {
                completion(nil, nil, "")
            }
        }
        completion(nil, nil, "")
    }
}

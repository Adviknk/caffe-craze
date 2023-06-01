//
//  ChargeApi.swift
//  Caffe Craze
//
//  Created by Advik Nakirikanti on 7/15/20.
//  Copyright © 2020 Advik Nakirikanti. All rights reserved.
//

//
//  Copyright © 2018 Square, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

class ChargeApi {
    static public func processPayment(_ nonce: String, money: Int, order: String, completion: @escaping (String?, String?) -> Void) {
        let url = URL(string: "https://caffecrazeapp.herokuapp.com/chargeForCookie")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        print(money)
        print(order)
        let json = [

                "nonce": nonce,
                "note" : order,
                "money": money,

            ] as [String : Any]
        let httpBody = try? JSONSerialization.data(withJSONObject: json)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error as NSError?{
                if error.domain == NSURLErrorDomain {
                    DispatchQueue.main.async {
                        completion("", "Could not contact host")
                    }
                } else {
                    DispatchQueue.main.async {
                        completion("", "Something went wrong")
                    }
                }
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    print(json)
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                        DispatchQueue.main.async {
                            completion("success", nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion("", json["errorMessage"] as? String)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion("", "Failure")
                    }
                }
            }
        }.resume()
    }
}


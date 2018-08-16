//
//  NetworkRequest.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/16.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import Foundation
import UIKit
// test
//let basePostURL = "https://api.einvoice.nat.gov.tw/PB2CAPIVAN/invapp/InvApp"
//var postURLencoded = "version=0.2&action=QryWinningList&invTerm=10702&appID=EINV0201801356453"

func requestWithURLencoded(urlString: String, parameters: String , completion: @escaping (Data) -> Void){
    let url = URL(string: urlString)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-Type")
    request.httpBody = parameters.data(using: .utf8)
    
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        if error != nil { print(error! as NSError)
    }else {
        guard let data = data else {return}
        completion(data)
        }
    }
    task.resume()
}

extension Data {
    func parseData() -> Any {
        let webJSONDecode = try? JSONDecoder().decode(WebJSONDecodeModel.self, from: self)
        return webJSONDecode as Any
    }
    mutating func appendString(string: String) {
        let data = string.data(using: .utf8, allowLossyConversion: true)
        append(data!)
    }
    
}

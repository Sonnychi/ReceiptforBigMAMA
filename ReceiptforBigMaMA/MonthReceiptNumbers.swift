//
//  MonthReceiptNumbers.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/17.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import Foundation

class MonthReceiptNumbers {
    
    var special200: String?
    var special1000: String?
    var normalNums: [String]?
    var addNums: [String]?
    
    init(data: Data) {
        
        // decode data...
        
        self.special200 = "12345678"
    }
}

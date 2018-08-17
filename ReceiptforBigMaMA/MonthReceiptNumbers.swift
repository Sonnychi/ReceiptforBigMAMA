//
//  MonthReceiptNumbers.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/17.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import Foundation

class MonthReceiptNumbers {
    
    var year: Int = 0
    var month: Int = 0
    var special200: String?
    var special1000: String?
    var normalNums: [String]?
    var addNums: [String]?
    
    init(year: Int, month: Int, data: Data) {
        
        self.year = year
        self.month = month
        // decode data...
        
        self.special200 = "12345678"
    }
}

//
//  JSONDecodeModel.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/16.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import Foundation

struct WebJSONDecodeModel : Decodable {
    var v: String //版本號碼
    var code: String //訊息回應碼
    var msg: String //系統回應訊息
    var invoYm: String //查詢開講期別
    var superPrizeNo: String //千萬特獎號碼
    var spcPrizeNo: String //特獎號碼
    var spcPrizeNo2: String? //特獎號碼2
    var spcPrizeNo3: String? //特獎號碼3
    var firstPrizeNo1: String //頭獎號碼1
    var firstPrizeNo2: String //頭獎號碼2
    var firstPrizeNo3: String //頭獎號碼3
    var firstPrizeNo4: String? //頭獎號碼4
    var firstPrizeNo5: String? //頭獎號碼5
    var firstPrizeNo6: String? //頭獎號碼6
    var firstPrizeNo7: String? //頭獎號碼7
    var firstPrizeNo8: String? //頭獎號碼8
    var firstPrizeNo9: String? //頭獎號碼9
    var firstPrizeNo10: String? //頭獎號碼10
    var sixthPrizeNo1: String? //六獎號碼1
    var sixthPrizeNo2: String? //六獎號碼2
    var sixthPrizeNo3: String? //六獎號碼3
    var sixthPrizeNo4: String? //六獎號碼4
    var sixthPrizeNo5: String? //六獎號碼5
    var sixthProzeNo6: String? //六獎號碼6
    var superPrizeAmt: String //千萬特獎金額
    var spcPrizeAmt: String //特獎金額
    var firstPrizeAmt: String //頭獎金額
    var secondPrizeAmt: String //二獎金額
    var thirdPrizeAmt: String //三獎金額
    var fourthPrizeAmt: String //四獎金額
    var fifthPrizeAmt: String //五獎金額
    var sixthPrizeAmt: String //六獎金額
    
}

//
//  ReceiptManager.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/17.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import Foundation

class ReceiptManager: NSObject {
    
    static let sharedInstance = ReceiptManager()
    
    var currentYear: Int = 0
    var currentMonth: Int = 0
    
    override init() {
        super.init()
        getCurrentDate()
        
    }
    
    func gotoNextMonth() {
        currentMonth = currentMonth + 2
    }
    
    func gotoPreviousMonth() {
        currentMonth = currentMonth - 2
    }
    
    func getCurrentMonthReceiptNumber(completion: @escaping (MonthReceiptNumbers?) -> Void) {
        getMonthReceiptNumber(year: currentYear, month: currentMonth, completion: completion)
    }
    
    func getCurrentDate() {
        let date = Date()
        //        let formatter = DateFormatter()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        var receiptMonth = 0
        let year =  ((components.year)! - 1911)
        var month = components.month!
        //        var month = 1
        let day = components.day!
        
        //        if month % 2 == 0 ?? (receiptMonth = month) : (receiptMonth = month)
        
        if month % 2 == 0 {
            receiptMonth = month
        }else {
            receiptMonth = month + 1
        }
        
        print("現在是\(year)年\(month)月\(day)日, 要找\(year)年\(receiptMonth)月的兌獎號碼清單")

        currentYear = year
        currentMonth = receiptMonth
    }
    
    
    
    func getMonthReceiptNumber(year: Int, month: Int, completion: @escaping (MonthReceiptNumbers?) -> Void) {
        
        let receiptId = String(format: "%d%02d", year, month)
        print("receiptId: \(receiptId)")
        
        if let data = getReceiptData(receiptId: receiptId) {
            print(">>> read: \(data)")
            
            let receiptNumber = MonthReceiptNumbers(year: year, month: month, data: data)
            completion(receiptNumber)
        }
        else { // data not exist
            downloadReceiptData(receiptId: receiptId, completion: {(data: Data?) -> () in
                if let data = data {
                    print(">>> download: \(data)")
                    
                    let receiptNumber = MonthReceiptNumbers(year: year, month: month, data: data)
                    completion(receiptNumber)
                }
                else {
                    completion(nil)                    
                }
            })
        }
    }
    
    
    private func getReceiptData(receiptId: String) -> Data? {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(receiptId)
            if let data = try? Data(contentsOf: fileURL) {
                return data
            }
        }
        return nil
    }
    
    private func downloadReceiptData(receiptId: String, completion: @escaping (Data?) -> Void) {
        
        let basePostURL = "https://api.einvoice.nat.gov.tw/PB2CAPIVAN/invapp/InvApp"
        let postURLencoded = "version=0.2&action=QryWinningList&invTerm=\(receiptId)&appID=EINV0201801356453"
        
        requestWithURLencoded(urlString: basePostURL, parameters: postURLencoded, completion: {(data) -> Void in
           
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = dir.appendingPathComponent(receiptId)
                
                do {
                    try data.write(to: fileURL, options: .atomic)
                    completion(data)
                }
                catch {
                    print(error)
                    completion(nil)
                    return
                }
            }
        })
    }
    

    
    
}

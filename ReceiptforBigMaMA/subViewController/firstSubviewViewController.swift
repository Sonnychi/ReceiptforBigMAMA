//
//  firstSubviewViewController.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/15.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import UIKit

class firstSubviewViewController: UIViewController {
    let basePostURL = "https://api.einvoice.nat.gov.tw/PB2CAPIVAN/invapp/InvApp"
    var postURLencoded = "version=0.2&action=QryWinningList&invTerm=10612&appID=EINV0201801356453"
    

    @IBOutlet weak var subTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let receiptManager = ReceiptManager.sharedInstance
        
        receiptManager.getMonthReceiptNumber(year: 107, month: 3, completion: {(receiptNumber: MonthReceiptNumbers?) -> () in
            guard let receiptNumber = receiptNumber else { return }
            print(">>>>>\(receiptNumber.special200!)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subTitleLabel.text = "中獎資訊"
        
//        checkWinningFile()
    }


    @IBAction func showWebDecodeBtn(_ sender: UIButton) {
        
        
    }
    
    func checkWinningFile() {
        requestWithURLencoded(urlString: basePostURL, parameters: postURLencoded, completion: {(Data) -> Void in
            var webDecodeFile = Data.parseData() as! WebJSONDecodeModel
//            print("checkWinningFilea: \(webDecodeFile.invoYm)")
            self.storeDataToFile(fileName: "\(webDecodeFile.invoYm)", data: Data)
        })
    }
    
    func storeDataToFile(fileName: String,data: Data){
        
        let file = "\(fileName).text"
        print(file)
        //let text = "some text"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let fileURL = dir.appendingPathComponent(file)

            //writing
            do {
                try data.write(to: fileURL, options: .atomic)
                
                //(to: fileURL, atomically: false, encoding: .utf8)
                //try Data.wri
            }
            catch {
                print(error)
                return}

            //reading
            do {
                //let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                if let data2 = try? Data(contentsOf: fileURL) {
                    
//                    print("data2 : \(data2)")
                    
                    let decoder = JSONDecoder()
                    if let file10612 = try? decoder.decode(WebJSONDecodeModel.self, from: data2) {
                        print(file10612)
                    }
                }
            }
            catch {
                print(error)
                return}
            
            //============ file path / URL  ==========
            let path = NSHomeDirectory() + "/Documents/"
//            print("路徑檔案: \(path)")
            let documentURL = URL(fileURLWithPath: path)
//            print("檔案URL : \(documentURL)")
            
            //============ file search  ==========
//            let fileManager = FileManager()
//            do {
//                let fileList = try fileManager.contentsOfDirectory(atPath:NSHomeDirectory()+"/Documents")
//                for file in fileList {
//                    print(">\(file)")
//                }
//            }catch{
//                print("no file exit")
//            }
        }
    }
    
}

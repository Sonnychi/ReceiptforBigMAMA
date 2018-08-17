//
//  secondSubviewViewController.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/15.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import UIKit

class secondSubviewViewController: UIViewController {
    //var winningFileArrayIndex:
    
    var index = 0
    var winningFileArray = ["107年 1.2 月","107年 3.4 月","107年 5.6 月","107年 7.8 月"]
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var winningFileLabel: UILabel!

    @IBAction func leftBtn(_ sender: UIButton) {
        index = index - 1
        if index < 0 { index = 0 }
        updateMonthLabel()
    }
    
    @IBAction func rightBtn(_ sender: UIButton) {
        index = index + 1
        if index == winningFileArray.count { index = winningFileArray.count - 1 }
        updateMonthLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let receiptManager = ReceiptManager.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subTitleLabel.text = "手動輸入"
        updateMonthLabel()
        
    }
    
    func updateMonthLabel() {
        winningFileLabel.text = winningFileArray[index]
    }

}

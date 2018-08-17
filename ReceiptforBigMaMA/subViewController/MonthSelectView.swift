//
//  MonthSelectView.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/15.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import UIKit

class MonthSelectView: UIView {

    var index = 0
    let receiptManager = ReceiptManager.sharedInstance
    //var winningFileArray = ["107年 1.2 月","107年 3.4 月","107年 5.6 月","107年 7.8 月"]
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var winningFileLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // =========================================================================
    // MARK: - Private Functions
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("MonthSelectView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        contentView.backgroundColor = UIColor.clear
        
        self.backgroundColor = UIColor.clear
        
        updateMonthLabel()
    }
    
    private func updateMonthLabel() {
//        winningFileLabel.text = winningFileArray[index]
       
        winningFileLabel.text = "\(receiptManager.currentYear)\(receiptManager.currentMonth)"
        
        
        // test
        receiptManager.getCurrentMonthReceiptNumber(completion: {(receiptNumbers: MonthReceiptNumbers?) -> () in
            if let receipt = receiptNumbers {
                print(">>>>>>\(receipt.special200)")
            }
        })
    }
    // =========================================================================
    // MARK: - IBAction
    
    @IBAction func leftBtn(_ sender: UIButton) {
        
        receiptManager.gotoPreviousMonth()
//        index = index - 1
//        if index < 0 { index = 0 }
        updateMonthLabel()
    }
    
    @IBAction func rightBtn(_ sender: UIButton) {
        
        receiptManager.gotoNextMonth()
//        index = index + 1
//        if index == winningFileArray.count { index = winningFileArray.count - 1 }
        updateMonthLabel()
    }
    
  
    
}

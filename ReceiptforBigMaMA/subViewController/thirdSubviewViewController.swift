//
//  thirdSubviewViewController.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/15.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import UIKit

class thirdSubviewViewController: UIViewController {

    @IBOutlet weak var subTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subTitleLabel.text = "QR Code 掃描"
    }

}

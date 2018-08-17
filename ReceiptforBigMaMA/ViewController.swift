//
//  ViewController.swift
//  ReceiptforBigMaMA
//
//  Created by Sonny on 2018/8/14.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var mainCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    
    var cellName = ["中獎資訊","手動輸入","QR Code掃瞄","傳統發票掃瞄"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTitleLabel.text = "Receipt For BigMAMA"
//        currentDate()
        
    }
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mainCollectionViewCell
        cell.mainCollectionViewCellLabel.text = cellName[indexPath.row]
        
        switch  indexPath.row {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.8588235294, blue: 0.7254901961, alpha: 1)
        case 1 :
            cell.backgroundColor = #colorLiteral(red: 0.6823529412, green: 0.862745098, blue: 0.8470588235, alpha: 1)
        case 2 :
            cell.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.7137254902, blue: 0.7411764706, alpha: 1)
        default:
            cell.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.768627451, blue: 0.9647058824, alpha: 1)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstSubviewController = storyboard.instantiateViewController(withIdentifier :"firstSubview")
        let secondSubviewController = storyboard.instantiateViewController(withIdentifier: "secondSubview")
        let thirdSubviewController = storyboard.instantiateViewController(withIdentifier: "thirdSubview")
        let fourthSubviewController = storyboard.instantiateViewController(withIdentifier: "fourthSubview")
        
        switch indexPath.row {
        case 0:
            //self.present(viewController, animated: true)
            self.navigationController?.pushViewController(firstSubviewController, animated: true)
        case 1:
            self.navigationController?.pushViewController(secondSubviewController, animated: true)
        case 2:
            self.navigationController?.pushViewController(thirdSubviewController, animated: true)
        default:
            self.navigationController?.pushViewController(fourthSubviewController, animated: true)
            
        }
        
    }
    
    
    
}

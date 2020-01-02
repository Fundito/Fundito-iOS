//
//  Tab2CollectionViewCell.swift
//  Fundito
//
//  Created by kimhyeji on 1/3/20.
//  Copyright © 2020 Fundito. All rights reserved.
//

import UIKit

class Tab2CollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "Tab2CollectionViewCell"
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var fundingMoneyLabel: UILabel!
    @IBOutlet weak var refundMoneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText(label: storeName, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: dueDateLabel, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .blueberry)
        setupText(label: fundingMoneyLabel, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
        
        let attributedString = NSMutableAttributedString(string: "30,000 원 회수", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 16.0)!,
          .foregroundColor: UIColor.blueberry
        ])
        attributedString.addAttributes([
          .font: UIFont.textStyle3,
          .foregroundColor: UIColor.darkNavy
        ], range: NSRange(location: 7, length: 4))
        refundMoneyLabel.attributedText = attributedString
        
    }
    
    func setupText( label: UILabel, fontName: String, size: CGFloat, color: UIColor) {
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }
}

// model
//var storeName: String
//var dueDate: String
//var fundingMoney: Int
//var refundMoney: Int

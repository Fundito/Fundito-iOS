//
//  storeTimelineCollectionViewCell.swift
//  Fundito
//
//  Created by kimhyeji on 1/3/20.
//  Copyright © 2020 Fundito. All rights reserved.
//

import UIKit

class storeTimelineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fundingMoney: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var elapsedTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText(label: fundingMoney, fontName: "SpoqaHanSans-Bold", size: 15.0, color: .black)
        setupText(label: userName, fontName: "SpoqaHanSans-Regular", size: 15.0, color: .black)
        setupText(label: elapsedTime, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .black)
        
    }
    
    func setupText( label: UILabel, fontName: String, size: CGFloat, color: UIColor) {
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }
}

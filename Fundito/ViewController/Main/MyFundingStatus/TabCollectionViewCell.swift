//
//  TabCollectionViewCell.swift
//  Fundito
//
//  Created by kimhyeji on 12/27/19.
//  Copyright © 2019 Fundito. All rights reserved.
//


import UIKit

class TabCollectionViewCell: UICollectionViewCell{

    static var identifier: String = "TabCollectionViewCell"
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var leftDays: UILabel!
    @IBOutlet weak var successRate: UILabel!
    @IBOutlet weak var fundingProgressView: FundingProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText(label: storeName, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        setupText(label: leftDays, fontName: "SpoqaHanSans-Regular", size: 16.0, color: .blueberry)
        setupText(label: successRate, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .blueberry)
        
    }
    
    func setupText( label: UILabel, fontName: String, size: CGFloat, color: UIColor) {
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }
}

//
//  MyFundingStatusTableViewCell.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class MyFundingStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var fundingMoney: UILabel!
    @IBOutlet weak var returnMoney: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func setFundingMoney() {
        let attributedString = NSMutableAttributedString(string: "회수금액 8,500원 (170%)", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor.blueberry
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(white: 0.0, alpha: 1.0), range: NSRange(location: 0, length: 4))
         returnMoney.attributedText = attributedString
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
//        self.contentView.layer.borderWidth = 0.0
//        self.contentView.layer.borderColor = UIColor.gray.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

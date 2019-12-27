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
    @IBOutlet weak var MoneyPer: UILabel!
    @IBOutlet weak var time: UILabel!
    
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

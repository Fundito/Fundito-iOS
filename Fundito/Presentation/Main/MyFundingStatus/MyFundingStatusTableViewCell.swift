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
    
    func setLableText() {
        date.attributedText = NSMutableAttributedString(string: date.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 112.0 / 255.0, green: 112.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
        ])
        storeName.attributedText = NSMutableAttributedString(string: storeName.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor(red: 112.0 / 255.0, green: 112.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
        ])
        fundingMoney.attributedText = NSMutableAttributedString(string: fundingMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        ])
        let attributedString = NSMutableAttributedString(string: "회수금액 8,500원 (170%)", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor.blueberry
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(white: 0.0, alpha: 1.0), range: NSRange(location: 0, length: 4))
        returnMoney.attributedText = attributedString
        time.attributedText = NSMutableAttributedString(string: time.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 112.0 / 255.0, green: 112.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

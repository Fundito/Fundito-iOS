//
//  StorePopUpView.swift
//  Fundito
//
//  Created by kimhyeji on 12/29/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class StorePopUpView: UIView {
    
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeMessage: UILabel!
    @IBOutlet weak var fundingMoneyLabel: UILabel!
    @IBOutlet weak var fundingMoney: UILabel!
    @IBOutlet weak var expectedMaxReturnMoneyLabel: UILabel!
    @IBOutlet weak var expectedMaxReturnMoney: UILabel!
    @IBOutlet weak var recentFundingListLabel: UILabel!
    @IBOutlet weak var storeDetailBtn: UIButton!

    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var secondLine: UIView!
    
    @IBOutlet weak var recentFundingList: UITableView!
    
    func viewInit(){
        setLabelText()
        firstLine.backgroundColor = UIColor.greyish
        secondLine.backgroundColor = UIColor.greyish
        secondLine.alpha = 0.24
        
        recentFundingList.delegate = self
        recentFundingList.dataSource = self
        recentFundingList.rowHeight = 83
        recentFundingList.backgroundColor = .clear
        recentFundingList.isScrollEnabled = false
    }
    
    func setLabelText() {
        storeName.attributedText = NSMutableAttributedString(string: storeName.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 30.0)!,
          .foregroundColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        ])
        storeMessage.attributedText = NSMutableAttributedString(string: storeMessage.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Bold", size: 16.0)!,
          .foregroundColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        fundingMoneyLabel.attributedText = NSMutableAttributedString(string: fundingMoneyLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        fundingMoney.attributedText = NSMutableAttributedString(string: fundingMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 32.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        expectedMaxReturnMoneyLabel.attributedText = NSMutableAttributedString(string: expectedMaxReturnMoneyLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        expectedMaxReturnMoney.attributedText = NSMutableAttributedString(string: expectedMaxReturnMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 32.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        recentFundingListLabel.attributedText = NSMutableAttributedString(string: recentFundingListLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        ])
    }

}

extension StorePopUpView: UITableViewDelegate { }

extension StorePopUpView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StorePopUpTableViewCell") as! StorePopUpTableViewCell
        cell.backgroundColor = .clear
//        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

// UITalbeView 에 얼마나 많은 리스트를 담을 지 설정합니다.
// 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}

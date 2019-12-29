//
//  FirstPopUpView.swift
//  Fundito
//
//  Created by kimhyeji on 12/29/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class FirstPopUpView: UIView {
    
    @IBOutlet weak var topReceiptImage: UIImageView!
    @IBOutlet weak var funditoMoneyLabel: UILabel!
    @IBOutlet weak var funditoMoney: UILabel!
    @IBOutlet weak var fundingMoneyLabel: UILabel!
    @IBOutlet weak var fundingMoney: UILabel!
    @IBOutlet weak var expectedMaxRetrunMoneyLabel: UILabel!
    @IBOutlet weak var expectedMaxRetrunMoney: UILabel!

    @IBOutlet weak var recentFundingListLabel: UILabel! //

    @IBOutlet weak var pointChargingBtn: UIButton!
    @IBOutlet weak var myFundingStatusTable: UITableView!
    
    func viewInit(){
        
        //self.view.sendSubviewToBack(self.backgroundReciptImage) // 백그라운드 이미지 들어오면
        setLabelText()
        
        topReceiptImage.backgroundColor = .clear
        
        myFundingStatusTable.delegate = self
        myFundingStatusTable.dataSource = self
        myFundingStatusTable.rowHeight = 83
        myFundingStatusTable.backgroundColor = .clear
        myFundingStatusTable.isScrollEnabled = false
    }

    // set label.text font, size, color
    func setLabelText() {
        funditoMoneyLabel.attributedText = NSMutableAttributedString(string: funditoMoneyLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        funditoMoney.attributedText = NSMutableAttributedString(string: funditoMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 30.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        fundingMoneyLabel.attributedText = NSMutableAttributedString(string: fundingMoneyLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        fundingMoney.attributedText = NSMutableAttributedString(string: fundingMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 30.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        expectedMaxRetrunMoneyLabel.attributedText = NSMutableAttributedString(string: expectedMaxRetrunMoneyLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        expectedMaxRetrunMoney.attributedText = NSMutableAttributedString(string: expectedMaxRetrunMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 30.0)!,
          .foregroundColor: UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ])
        recentFundingListLabel.attributedText = NSMutableAttributedString(string: recentFundingListLabel.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
          .foregroundColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        ])
    }
}

extension FirstPopUpView: UITableViewDelegate { }

extension FirstPopUpView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFundingStatusTableViewCell") as! MyFundingStatusTableViewCell
        cell.setLableText()
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

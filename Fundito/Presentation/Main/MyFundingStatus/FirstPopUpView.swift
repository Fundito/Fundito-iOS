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

    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var secondLine: UIView!
    @IBOutlet weak var recentFundingListLabel: UILabel! //

    @IBOutlet weak var pointChargingBtn: UIButton!
    @IBOutlet weak var myFundingStatusTable: UITableView!
    
    @IBOutlet weak var secondPopUpView: SecondPopUpView!
    @IBOutlet weak var storePopUpView: StorePopUpView!
    
    func viewInit(){
        
        //self.view.sendSubviewToBack(self.backgroundReciptImage) // 백그라운드 이미지 들어오면
        setLabelText()
        firstLine.backgroundColor = UIColor.greyish
        secondLine.backgroundColor = UIColor.greyish
        secondLine.alpha = 0.24
        
        topReceiptImage.backgroundColor = .clear
        
        myFundingStatusTable.delegate = self
        myFundingStatusTable.dataSource = self
        myFundingStatusTable.rowHeight = 83
        myFundingStatusTable.backgroundColor = .clear
        myFundingStatusTable.isScrollEnabled = false
//        myFundingStatusTable.register(FirstPopUpTableViewCell.self, forCellReuseIdentifier: "FirstPopUpTableViewCell")
        
        setupPopUpView()
        setupGestureRecognizer()
        
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

extension FirstPopUpView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = indexPath.row
        self.storePopUpView.frame.origin.y = 0
        self.secondPopUpView.frame.origin.y = 700
        
    }
}

extension FirstPopUpView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstPopUpTableViewCell") as! FirstPopUpTableViewCell
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

extension FirstPopUpView {
    
    // init
    func setupPopUpView() {
        let frameSecond = CGRect(x: 0, y: 586, width: self.frame.width, height: self.frame.height)
        secondPopUpView.frame = frameSecond
        secondPopUpView.viewInit()
        self.addSubview(secondPopUpView)
       
        let frameStore = CGRect(x: 0, y: 700, width: self.frame.width, height: self.frame.height)
        storePopUpView.frame = frameStore
        storePopUpView.viewInit()
        self.addSubview(storePopUpView)
//        print("frameinit")
    }
    
    func setupGestureRecognizer() {
        let panSecond = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureSecond(_:)))
        panSecond.delegate = self
        self.secondPopUpView.addGestureRecognizer(panSecond)
        
        let panStore = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureStore(_:)))
        panStore.delegate = self
        self.storePopUpView.addGestureRecognizer(panStore)
//        print("Gestureinit")
    }
    
    @objc func handlePanGestureSecond(_ pan: UIPanGestureRecognizer) {
        let touchLocation = pan.location(in: self)
        let velocity = pan.velocity(in: self)
        
        switch pan.state {
        case .began:
            print("beganSecond")
        case .changed:
            // 올려있는 상태에서는 내리기만 가능하도록
            if(self.secondPopUpView.frame.origin.y == 0)   {
                if (velocity.y < 0) {}
                else {self.secondPopUpView.frame.origin.y = touchLocation.y}
            } else{
                self.secondPopUpView.frame.origin.y = touchLocation.y
            }
        case .ended:
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
                if velocity.y > 0 {
                    if(self.secondPopUpView.frame.origin.y == 0) {
                        
                    } else{
                        self.secondPopUpView.frame.origin.y = 586
                    }
                } else if velocity.y == 0 {
                    //현재 마지막 팬 제스쳐 방향을 저장해두고 그 방향대로 뷰 위치 지정
                    
                } else {
                    
                    self.secondPopUpView.frame.origin.y = 0
                }
            })
        default:
            print("default")
        }
    }
    
    @objc func handlePanGestureStore(_ pan: UIPanGestureRecognizer) {
            let touchLocation = pan.location(in: self)
            let velocity = pan.velocity(in: self)
            
            switch pan.state {
            case .began:
                print("beganStore")
            case .changed:
                if(self.storePopUpView.frame.origin.y == 0) {
                    if (velocity.y < 0) {}
                    else {self.storePopUpView.frame.origin.y = touchLocation.y}
                } else{
                    self.storePopUpView.frame.origin.y = touchLocation.y
                }
            case .ended:
                UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
                    if velocity.y > 0 {
                        if(self.storePopUpView.frame.origin.y == 0) {
                            
                        } else{
                            self.storePopUpView.frame.origin.y = 700
                            self.secondPopUpView.frame.origin.y = 586
                        }
                    } else if velocity.y == 0 {
                        
                        //현재 마지막 팬 제스쳐 방향을 저장해두고 그 방향대로 뷰 위치 지정
                    } else {
                        self.storePopUpView.frame.origin.y = 0
                    }
                })
            default:
                print("default")
            }
        }
    
}

extension FirstPopUpView: UIGestureRecognizerDelegate {
    
}

//
//  MyFundingStatusVC2.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//
//  not use storyboard

import UIKit

class MyFundingStatusVC2: UIViewController {

    
    @IBOutlet weak var backgroundReciptImage: UIImageView!
    
    @IBOutlet weak var funditoMoneyLabel: UILabel!
    @IBOutlet weak var funditoMoney: UILabel!
    @IBOutlet weak var fundingMoneyLabel: UILabel!
    @IBOutlet weak var fundingMoney: UILabel!
    @IBOutlet weak var expectedMaxRetrunMoneyLabel: UILabel!
    @IBOutlet weak var expectedMaxRetrunMoney: UILabel!
    
    @IBOutlet weak var recentFundingListLabel: UILabel! //godiehla
    
    @IBOutlet weak var pointChargingBtn: UIButton!
    @IBOutlet weak var myFundingStatusTable: UITableView!
    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var swipeRecognizerDown: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtn()

        self.view.sendSubviewToBack(self.backgroundReciptImage)

        swipeRecognizer.direction = .up
        swipeRecognizerDown.direction = .down
    
        myFundingStatusTable.delegate = self
        myFundingStatusTable.dataSource = self
        myFundingStatusTable.rowHeight = 83
        myFundingStatusTable.backgroundColor = .clear
        myFundingStatusTable.isScrollEnabled = false
        
        setLableText()
        
        // show navigation and not show border
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = false
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = nil
        
    }
    
    // set label.text font, size, color
    func setLableText() {
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
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            print("up")
            let vc = storyboard?.instantiateViewController(withIdentifier: "MyFundingStatusVC3") as! MyFundingStatusVC3
//            vc.modalPresentationStyle = .overCurrentContext
//            vc.modalTransitionStyle = .crossDissolve
//            self.dismiss(animated: false, completion: nil)
            UIView.animate(withDuration: 0.2, animations: {
                UIView.setAnimationCurve(.linear)
                self.navigationController?.pushViewController(vc, animated: false)
            })
        } else if sender.direction == .down {
            print("down(pop)")
            UIView.animate(withDuration: 0.2, animations: {
                UIView.setAnimationCurve(.easeInOut)
                self.navigationController?.popViewController(animated: false)
            })
        }
    }
    
    // Set Custom Back Button
    func setBackBtn(){
        
        let backBTN = UIBarButtonItem(image: UIImage(named: "backarrowNavyIcon"), style: .plain, target: self, action: #selector(self.pop))
        backBTN.tintColor = .black
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    // pop func
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension MyFundingStatusVC2: UITableViewDelegate { }

extension MyFundingStatusVC2: UITableViewDataSource {
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

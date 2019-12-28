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
    
    
    @IBOutlet weak var pointChargingBtn: UIButton!
    @IBOutlet weak var myFundingStatusTable: UITableView!
    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var swipeRecognizerDown: UISwipeGestureRecognizer!
    
//    let yourAttributes: [NSAttributedString.Key: Any] = [
//        .font: UIFont.systemFont(ofSize: 20),
//        .foregroundColor: UIColor.black,
//        .underlineColor: UIColor.orange,
//        .underlineStyle: NSUnderlineStyle.thick.rawValue]

    override func viewDidLoad() {
        super.viewDidLoad()
//        setBackBtn()
//        let attributeString = NSMutableAttributedString(string: "충전하기", attributes: yourAttributes)
//        pointChargingBtn.setAttributedTitle(attributeString, for: .normal)
        self.view.sendSubviewToBack(self.backgroundReciptImage)

        
        // Line on medium
        let view = lineView(frame: self.view.frame)
        view.backgroundColor = .clear
        self.view.addSubview(view)
        // end Line on medium
        
        swipeRecognizer.direction = .up
        swipeRecognizerDown.direction = .down
    
        myFundingStatusTable.delegate = self
        myFundingStatusTable.dataSource = self
        
        
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            print("up")
            let vc = storyboard?.instantiateViewController(withIdentifier: "MyFundingStatusVC3") as! MyFundingStatusVC3
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
        let backBTN = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(self.pop))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    // pop func
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

class lineView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 387))
        path.addLine(to: CGPoint(x: 375, y: 387))
        path.close()
        path.lineWidth = 1.0
        UIColor.greyish.setStroke()
        path.stroke()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: 390))
        path2.addLine(to: CGPoint(x: 375, y: 390))
        path2.close()
        path2.lineWidth = 5.0
        UIColor.greyish.setStroke()
        path2.stroke()
    }
}

extension MyFundingStatusVC2: UITableViewDelegate { }

extension MyFundingStatusVC2: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFundingStatusTableViewCell") as! MyFundingStatusTableViewCell
        cell.setFundingMoney()
        
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

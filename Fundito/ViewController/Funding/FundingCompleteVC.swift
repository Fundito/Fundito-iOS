//
//  FundingCompleteVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class FundingCompleteVC : UIViewController{
	
    /**
     1) 투자금액은 present할 때 받아올까? 아님 그냥 서버?
     */
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewName: UILabel! // 서버-진행률, str.append, init
    @IBOutlet weak var processBar: UIImageView!
    @IBOutlet weak var storeName: UILabel! // 서버-상점이름, str.append, init
    @IBOutlet weak var fundingMoney: UILabel! // 서버-투자금액(?), str.append, init
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var allFundingMoneyLabel: UILabel!
    @IBOutlet weak var allFundingMoney: UILabel! //서버-투자금액(?), str.append, init
    @IBOutlet weak var expectedReturnMoneyLabel: UILabel!
    @IBOutlet weak var interestMoney: UILabel! // 이율계산 어떻게??? 결론은 이율금액
    @IBOutlet weak var resultMoney: UILabel! // interestMoney+투자금액, str.append, init
    @IBOutlet weak var completeBtn: UIButton!
    
    // 서버에서 받아올 금액
     let processingRateS = 17
     let storNameS = "황호댁"
     let fudningMoneyS = "5,000"
     let interestMoneyS = "3500"
     
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func completeBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToThis", sender: nil)
        /**
        2) 여기서 지금까지 present 해왔던 걸 다 없애고 다른 뷰로 이동해야 되지 않나 싶다 ?!?! 근데 어떻게 하는지 모르겠다
         */
//        let vc = storyboard?.instantiateViewController(withIdentifier: "FundingCompleteVC") as! FundingCompleteVC
//        vc.modalPresentationStyle = .currentContext
//        vc.modalTransitionStyle = .flipHorizontal
//        self.present(vc, animated: false, completion: nil)
    }
    
    
}

// MARK: Lifecycle
extension FundingCompleteVC{
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initView()
	}
}

// MARK: Initialization
extension FundingCompleteVC{
    private func initView(){
        setNavigation()
        setBackBtn()
        setLabel()
        setLine(line)
        setCompleteBtn(completeBtn)
    }
    
    func setNavigation() {
        viewName.attributedText = NSMutableAttributedString(string: viewName.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 18.0)!,
            .foregroundColor: UIColor.black
        ])
        
    }
    
    func setBackBtn() {
        backBtn.setImage(UIImage(named: "backarrowNavyIcon"), for: .application)
//        backBtn.currentImage = UIImage(named: "backarrowNavyIcon")
//        backBtn.tintColor = UIColor.darkNavy
    }
    
    func setLabel() {
        
        storeName.attributedText = NSMutableAttributedString(string: storeName.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Bold", size: 20.0)!,
            .foregroundColor: UIColor.black
        ])
        
        fundingMoney.attributedText = NSMutableAttributedString(string: fundingMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 20.0)!,
            .foregroundColor: UIColor.black
        ])
        
        allFundingMoneyLabel.attributedText = NSMutableAttributedString(string: allFundingMoneyLabel.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.black
        ])
        
        allFundingMoney.attributedText = NSMutableAttributedString(string: allFundingMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.black
        ])
        
        expectedReturnMoneyLabel.attributedText = NSMutableAttributedString(string: expectedReturnMoneyLabel.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.black
        ])
        
        interestMoney.attributedText = NSMutableAttributedString(string: interestMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Bold", size: 16.0)!,
            .foregroundColor: UIColor.black
        ])
        
        resultMoney.attributedText = NSMutableAttributedString(string: resultMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Bold", size: 16.0)!,
            .foregroundColor: UIColor.black
        ])
        
    }
    
    func setLine(_ line: UIView){
        line.borderWidth = 0.5
        line.borderColor = .pinkishGrey
        line.backgroundColor = .pinkishGrey
    }
    
    func setCompleteBtn(_ btn: UIButton) {
        btn.layer.cornerRadius = 8
        btn.layer.backgroundColor = UIColor.darkNavy.cgColor
        btn.layer.shadowRadius = 6
        btn.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.16).cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.setTitleColor(.white, for: .normal)
    }
    
    
}



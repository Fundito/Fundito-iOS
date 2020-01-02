//
//  FundingInputVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//
//![FundingInputVC](./image/FundingInputVC.png){: width="187.5" height="406.0"}
//![MyFundingStatusVC](./image/MyFundingStatusVC.png){: width="187.5" height="406.0"}
//![FirstPopUpView](./image/FirstPopUpView.png){: width="187.5" height="406.0"}

import UIKit

class FundingProgressVC : UIViewController{
	
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewName: UILabel!
    @IBOutlet weak var processBar: UIImageView!
    @IBOutlet weak var fundingMoney: UILabel!
    @IBOutlet weak var funditoMoney: UILabel!
    @IBOutlet weak var interestRate: UILabel!
    @IBOutlet weak var interestMoney: UILabel!
    @IBOutlet weak var plusImage: UIImageView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var resultMoney: UILabel!
    @IBOutlet weak var payBtn: UIButton!
 
     
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func payBtnAction(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "FundingCompleteVC") as! FundingCompleteVC
        let vc = storyboard?.instantiateViewController(withIdentifier: "FundingProgressPasswordVC") as! FundingProgressPasswordVC
        vc.modalPresentationStyle = .currentContext
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: false, completion: nil)
    }
    
}

// MARK: Lifecycle
extension FundingProgressVC{
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initView()
	}
}

// MARK: Initialization
extension FundingProgressVC{
    private func initView(){
        setNavigation()
        setBackBtn()
        setLabel()
        setLine(line)
        setCompleteBtn(payBtn)
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
        fundingMoney.attributedText = NSMutableAttributedString(string: fundingMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 32.0)!,
            .foregroundColor: UIColor.black
        ])
        
        funditoMoney.attributedText = NSMutableAttributedString(string: funditoMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
            .foregroundColor: UIColor(red: 92.0 / 255.0, green: 92.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
        ])
        
        interestRate.attributedText = NSMutableAttributedString(string: interestRate.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.blueberry
        ])
        
        interestMoney.attributedText = NSMutableAttributedString(string: interestMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 32.0)!,
            .foregroundColor: UIColor.black
        ])
        
        let attributedString = NSMutableAttributedString(string: "총  8,500 원", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 35.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        attributedString.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Regular", size: 35.0)!, range: NSRange(location: 0, length: 1))
        
        resultMoney.attributedText = attributedString
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

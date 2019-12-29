//
//  FundingInputVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class FundingInputVC : UIViewController{
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var inputCompleteBtn: UIButton!
    @IBOutlet weak var progressBar: UIImageView!
    @IBOutlet weak var inputMoney: UILabel!
    @IBOutlet weak var inputUnderLine: UIView!
    @IBOutlet weak var inputExplanation: UILabel!
    
    
}

// MARK: Lifecycle
extension FundingInputVC{
	override func viewDidLoad() {
		super.viewDidLoad()
        setNavigation()
        setBackBtn()
        setLabel()
        setLine(inputUnderLine)
        setinputCompleteBtn(inputCompleteBtn)
        
        
	}
    
    func setNavigation() {
    
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationItem.title = "투자금액"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        ]
        
    }
    
    func setBackBtn() {
        backBtn.image = UIImage(named: "backarrowNavyIcon")
        backBtn.tintColor = UIColor.darkNavy
    }
    
    func setLabel() {
        let attributedString = NSMutableAttributedString(string: inputMoney.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 32.0)!,
          .foregroundColor: UIColor.pinkishGrey
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(white: 0.0, alpha: 1.0), range: NSRange(location: 8, length: 2))
        
        inputMoney.attributedText = attributedString
        
        inputExplanation.attributedText = NSMutableAttributedString(string: inputExplanation.text ?? "", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
          .foregroundColor: UIColor(red: 132.0 / 255.0, green: 132.0 / 255.0, blue: 132.0 / 255.0, alpha: 1.0)
        ])
    }
    
    func setLine(_ line: UIView){
//        line.tintColor = .pinkishGrey
        line.borderWidth = 0.5
        line.borderColor = .pinkishGrey
        line.backgroundColor = .pinkishGrey
    }
    
    func setinputCompleteBtn(_ btn: UIButton) {
        btn.layer.cornerRadius = 8
        btn.layer.backgroundColor = UIColor.darkNavy.cgColor
        btn.layer.shadowRadius = 6
        btn.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.16).cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.setTitleColor(.white, for: .normal)
    }

    
}
// MARK: Initialization
extension FundingInputVC{
	private func initView(){
		
	}
}

extension UIButton{
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

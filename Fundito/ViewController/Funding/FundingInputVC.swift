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
    @IBOutlet weak var inputMoney: UITextField!
    @IBOutlet weak var inputMoneyUnit: UILabel!
    @IBOutlet weak var inputUnderLine: UIView!
    @IBOutlet weak var inputExplanation: UILabel!
    
    // 금액 충전이 필요할 때 보여지는 labels
    @IBOutlet weak var userCardInfo: UILabel!
    @IBOutlet weak var autoChargeMoney: UILabel!
    
    var funditoMoney: Int = 3000
    
    /**
    1) 잔액 받아와서  inputExplanation 조립 ( setinputLabel 안에)
    2) 자 만들어야 함
    3) 입력되는 값에 따라 (밑에 자의 움직임에 따라) inputMoney.text가 변경되어야 함
     */
    
    @IBAction func backBtnAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: false)
    }
    
    /**
     버튼 클릭 시
    4) 입력한 돈이 잔액보다 많으면 inputExplanation 을 hidden, 다른 레이블 두 개를 보이게
     */
    @IBAction func completeBtnAction(_ sender: UIButton) {
//
//        var textfieldInt: Int? = Int(inputMoney.text!)
//        
//        guard let textfieldInt: Int = Int(inputMoney.text) {
//            
//        } else {
//            //다시 텍스트 필드에 입력하도록
//        }
//        if( funditoMoney < textfieldInt! ){
//            
//        }
        
        if (inputExplanation.isHidden == true){
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "FundingProgressVC") as? FundingProgressVC else {
                return
            }
            
            vc.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .currentContext
        
            self.present(vc, animated: false, completion: nil)
//            print("view transition")
        } else {
            
//            // 여기에 입력과 잔액 비교 코드 들어가야 함
//            if (입력 > 잔액) {
//                inputExplanation.isHidden = true
//                userCardInfo.isHidden = false
//                autoChargeMoney.isHidden = false
//            } else {
//                뷰 이동. 금액을 가지고 ?!?!?!?!?!
//            }
            
            // test code (3 line)
            inputExplanation.isHidden = true
            userCardInfo.isHidden = false
            autoChargeMoney.isHidden = false
        }
    }
}

// MARK: Lifecycle
extension FundingInputVC{
	override func viewDidLoad() {
		super.viewDidLoad()
        inputMoney.delegate = self
        self.initView()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        self.inputMoney.becomeFirstResponder()
    }
}

// MARK: Initialization
extension FundingInputVC{
	private func initView(){
		setNavigation()
        setBackBtn()
        setLabel()
        setTextField()
        setLine(inputUnderLine)
        setCompleteBtn(inputCompleteBtn)
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
        inputMoneyUnit.attributedText = NSMutableAttributedString(string: inputMoneyUnit.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 32.0)!,
            .foregroundColor: UIColor.black
        ])
        
        /**
         1)  Server 에서 펀디토머니 잔액 받아와서 조립
         str = "펀디토머니: " str.append(잔액) str,append("원. 부족금액은 자동충전 됨."
         이런 식으로 하면 될 것 같고
         
         */
        inputExplanation.attributedText = NSMutableAttributedString(string: inputExplanation.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
            .foregroundColor: UIColor(red: 132.0 / 255.0, green: 132.0 / 255.0, blue: 132.0 / 255.0, alpha: 1.0)
        ])
        
        userCardInfo.attributedText = NSMutableAttributedString(string: userCardInfo.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
            .foregroundColor: UIColor(red: 223.0 / 255.0, green: 99.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
        ])
        
        autoChargeMoney.attributedText = NSMutableAttributedString(string: autoChargeMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 12.0)!,
            .foregroundColor: UIColor(red: 223.0 / 255.0, green: 99.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
        ])
        
        userCardInfo.isHidden = true
        autoChargeMoney.isHidden = true
        
    }
    
    func setTextField(){

//        inputMoney.becomeFirstResponder()
        inputMoney.borderColor = .clear
        inputMoney.borderStyle = .none
        inputMoney.backgroundColor = .clear
        inputMoney.frame.size = .init(width: 160.0, height: 47.0)
        inputMoney.attributedPlaceholder = NSMutableAttributedString(string: inputMoney.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 32.0)!,
            .foregroundColor: UIColor.pinkishGrey
        ])
//        inputMoney.attributedText =
    }
    
    func setLine(_ line: UIView){
        //        line.tintColor = .pinkishGrey
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

extension FundingInputVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.inputMoney.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.inputMoney.resignFirstResponder()
        //            self.dismiss(animated: true, completion: nil)
        return true
    }
}

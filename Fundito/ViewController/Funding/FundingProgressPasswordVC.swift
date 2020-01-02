//
//  FundingProgressPasswordVC.swift
//  Fundito
//
//  Created by kimhyeji on 12/31/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

// 레이블들 어떻게? 그냥 뷰만 띠울수는 없나?
// 입력한 데이터를 비교해서 맞으면 넘어가고, 틀리면 진동주면서 다시 입력하는 로직 필요
// 이

class FundingProgressPasswordVC: UIViewController {

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
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var firstPwView: UIView!
    @IBOutlet weak var secondPwView: UIView!
    @IBOutlet weak var thirdPwView: UIView!
    @IBOutlet weak var fourthPwView: UIView!
    @IBOutlet weak var fifthPwView: UIView!
    @IBOutlet weak var sixthPwView: UIView!
    
    @IBOutlet weak var firstPwTextField: PasswordTextField!
    @IBOutlet weak var secondPwTextField: PasswordTextField!
    @IBOutlet weak var thirdPwTextField: PasswordTextField!
    @IBOutlet weak var fourthPwTextField: PasswordTextField!
    @IBOutlet weak var fifthPwTextField: PasswordTextField!
    @IBOutlet weak var sixthPwTextField: PasswordTextField!
    
    var textFieldDidEditing: Bool = true
//    var password = ""

    @IBAction func backBtnAction(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        firstPwTextField.delegate = self
        secondPwTextField.delegate = self
        thirdPwTextField.delegate = self
        fourthPwTextField.delegate = self
        fifthPwTextField.delegate = self
        sixthPwTextField.delegate = self
        setupView()
        firstPwTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(handleDeleted), name: .init("deletePressed"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        firstPwTextField.becomeFirstResponder()
    }
    
    func setupView() {
        passwordView.backgroundColor = UIColor.darkNavy
        setupPwViewBackgorund(view: firstPwView)
        setupPwViewBackgorund(view: secondPwView)
        setupPwViewBackgorund(view: thirdPwView)
        setupPwViewBackgorund(view: fourthPwView)
        setupPwViewBackgorund(view: fifthPwView)
        setupPwViewBackgorund(view: sixthPwView)

        setupPwTextField(textField: firstPwTextField)
        setupPwTextField(textField: secondPwTextField)
        setupPwTextField(textField: thirdPwTextField)
        setupPwTextField(textField: fourthPwTextField)
        setupPwTextField(textField: fifthPwTextField)
        setupPwTextField(textField: sixthPwTextField)
        
        inputLabel.attributedText = NSMutableAttributedString(string: inputLabel.text ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.white
        ])
    }
    
    
    
}

extension FundingProgressPasswordVC {
    func setup() {
        passwordView.backgroundColor = UIColor.darkNavy
    }
}

extension FundingProgressPasswordVC: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard textFieldDidEditing else {
            textFieldDidEditing = true
            return
        }
        let isEmpty = textField.text?.isEmpty ?? false
        if textField == firstPwTextField {
//            print("first change")
            setPwViewBackground(view: firstPwView, isEmpty: isEmpty)
            if !isEmpty {

                secondPwTextField.becomeFirstResponder()
            }
        }
        if textField == secondPwTextField {
//            print("second change")
            setPwViewBackground(view: secondPwView, isEmpty: isEmpty)
            let _ = isEmpty ?
                firstPwTextField.becomeFirstResponder() :
                thirdPwTextField.becomeFirstResponder()
        }
        if textField == thirdPwTextField {
            setPwViewBackground(view: thirdPwView, isEmpty: isEmpty)
            let _ = isEmpty ?
                secondPwTextField.becomeFirstResponder() :
                fourthPwTextField.becomeFirstResponder()
        }
        if textField == fourthPwTextField {
            setPwViewBackground(view: fourthPwView, isEmpty: isEmpty)
            let _ = isEmpty ?
                thirdPwTextField.becomeFirstResponder() :
                fifthPwTextField.becomeFirstResponder()
        }
        if textField == fifthPwTextField {
            setPwViewBackground(view: fifthPwView, isEmpty: isEmpty)
            let _ = isEmpty ?
                fourthPwTextField.becomeFirstResponder() :
                sixthPwTextField.becomeFirstResponder()
        }
        if textField == sixthPwTextField {
            setPwViewBackground(view: sixthPwView, isEmpty: isEmpty)
            if !isEmpty{
                getText()
            }
        }
    }
    
    func setPwViewBackground(view: UIView, isEmpty: Bool) {
        view.backgroundColor = isEmpty ? .clear : .white
    }
    
    func setupPwViewBackgorund(view: UIView) {
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = view.bounds.height / 2
        view.backgroundColor = .clear
    }
    
    func setupPwTextField(textField: UITextField) {
        textField.delegate = self
        textField.tintColor = .clear
    }
    
    @objc func handleDeleted() {
        textFieldDidEditing = false
        if secondPwTextField.isFirstResponder {
            setPwViewBackground(view: firstPwView, isEmpty: true)
            firstPwTextField.becomeFirstResponder()
            firstPwTextField.text = ""
        }
        
        if thirdPwTextField.isFirstResponder {
            setPwViewBackground(view: secondPwView, isEmpty: true)
            secondPwTextField.becomeFirstResponder()
            secondPwTextField.text = ""
        }
        
        if fourthPwTextField.isFirstResponder {
            setPwViewBackground(view: thirdPwView, isEmpty: true)
            thirdPwTextField.becomeFirstResponder()
            thirdPwTextField.text = ""
        }
        
        if fifthPwTextField.isFirstResponder {
            setPwViewBackground(view: fourthPwView, isEmpty: true)
            fourthPwTextField.becomeFirstResponder()
            fourthPwTextField.text = ""
        }
        
        if sixthPwTextField.isFirstResponder {
            setPwViewBackground(view: fifthPwView, isEmpty: true)
            fifthPwTextField.becomeFirstResponder()
            fifthPwTextField.text = ""
        }
    }
    
    func getText() {
        var password = ""
        password += firstPwTextField.text! + secondPwTextField.text!
        password += thirdPwTextField.text! + fourthPwTextField.text!
        password += fifthPwTextField.text! + sixthPwTextField.text!
        print(password)
        
        // 비밀번호 맞으면 다음뷰로 넘어가는 로직 추가
        let vc = storyboard?.instantiateViewController(withIdentifier: "FundingCompleteVC") as! FundingCompleteVC
        vc.modalPresentationStyle = .currentContext
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: false, completion: nil)
        
        // 틀리면 모든 텍스트필드 지우고 firstPwTextField.becomFirstResponder() 사용하기
        //
    }
}


// MARK: Initialization
extension FundingProgressPasswordVC{
    private func initView(){
        setNavigation()
        setBackBtn()
        setLabel()
        setLine(line)
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
    
}

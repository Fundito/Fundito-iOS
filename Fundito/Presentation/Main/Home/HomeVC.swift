//
//  HomeVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var connectedView: UIView!
    @IBOutlet weak var connectedViewLabel: UILabel!
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeWiFi: UILabel!
    @IBOutlet weak var leftDaysLabel: UILabel!
    @IBOutlet weak var leftDays: UILabel!
    @IBOutlet weak var timeLineLabel: UILabel!
    
}


// MARK: Lifecycle
extension HomeVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}
// MARK: Initialization
extension HomeVC{
    private func initView(){
        setupTextField( textField: searchTextField)
        setupLabel()
        setupImageView(image: storeImage)
        setupView(view: connectedView)
        
    }
    
    private func setupTextField( textField: UITextField){
        
        // radius 안먹음
        textField.cornerRadius = 19
        
        // Textfield 높이
        textField.frame.size.height = 37
        
        // Textfield 배경색
        textField.backgroundColor = UIColor.init(displayP3Red: 235.0/255.0, green: 236.0/255.0, blue: 237.0/255.0, alpha: 1)
        // TextField border
        textField.borderStyle = .none
        textField.borderColor = UIColor.init(displayP3Red: 235.0/255.0, green: 236.0/255.0, blue: 237.0/255.0, alpha: 1)
        
        
        // placeholder 글씨체
//        let attributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.greyish,
//            NSAttributedString.Key.font : UIFont(name: "SpoqaHanSans-Regular", size: 16)! // Note the !
//        ]
//
//        textField.attributedPlaceholder = NSAttributedString(string: textField.text ?? "", attributes:attributes)
        
        textField.attributedPlaceholder = .init(string: textField.placeholder ?? "", attributes: [
            .font: UIFont(name: "SpoqaHanSans-Regular", size: 16.0)!,
            .foregroundColor: UIColor.greyish
        ])
        
        // placeholder padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 37))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    private func setupLabel(){
        // welcomeLabel
        let attributedString = NSMutableAttributedString(string: "홍지원님,\n식사는 잘 하셨나요?", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Light", size: 24.0)!,
          .foregroundColor: UIColor.darkNavy
        ])
        attributedString.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Regular", size: 24.0)!, range: NSRange(location: 0, length: 3))
        
        welcomeLabel.attributedText = attributedString
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.numberOfLines = 2
        
        // connectedViewLabel
        setupText(label: connectedViewLabel, fontName: "SpoqaHanSans-Bold", size: 12.0, color: .darkNavy)
        // storeName
        setupText(label: storeName, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .black)
        // storeWiFi
        setupText(label: storeWiFi, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .black)
        // leftDaysLabel
        setupText(label: leftDaysLabel, fontName: "SpoqaHanSans-Bold", size: 12.0, color: .charcoalGrey)
        // leftDays
        setupText(label: leftDays, fontName: "SpoqaHanSans-Bold", size: 16.0, color: .charcoalGrey)
        // timeLineLabel
        setupText(label: timeLineLabel, fontName: "SpoqaHanSans-Regular", size: 12.0, color: .charcoalGrey)
    }
    
    private func setupImageView( image: UIImageView){
        // storeImage
        storeImage.cornerRadius = storeImage.frame.size.height/2
    }
    
    func setupView(view: UIView){
        // connectedView
        // radius 8
        view.cornerRadius = 8
        // opacity 68
        view.backgroundColor = UIColor(white: 1, alpha: 0.68)
        // border pinkishGrey 1pt inside
        view.borderColor = .pinkishGrey
        view.borderWidth = 1
        // shadow blur 18
        view.shadowOpacity = 18
        // rgba 0,0,0, 0.08
        view.shadowColorExtension = UIColor(displayP3Red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.08)
//        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "homeBgrImg") ?? nil)!)
    }
    
    func setupText( label: UILabel, fontName: String, size: CGFloat, color: UIColor) {
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }
}


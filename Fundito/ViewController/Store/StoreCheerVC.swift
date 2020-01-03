//
//  StoreVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class StoreCheerVC : UIViewController{
	
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var cheerLabel: UILabel!
    @IBOutlet weak var cheerLabel2: UILabel!
    
    @IBOutlet weak var cheerPointView: UIView!
    @IBOutlet weak var cheerPointLabel: UILabel!
    @IBOutlet weak var cheerPointLabel2: UILabel!
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var cheerBtn: UIButton!

    var paramStoreName: String?
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
}

// MARK: Lifecycle
extension StoreCheerVC{
	override func viewDidLoad() {
		super.viewDidLoad()
		initView()
	}
}
// MARK: Initialization
extension StoreCheerVC{
	private func initView(){
        setNavi()
        setBackBtn()
		setLabel()
        setBtn()
        cheerPointView.borderWidth = 1.0
        cheerPointView.borderColor = UIColor(white: 0.0, alpha: 0.16)
        cheerPointView.cornerRadius = 8
    }
    
    @objc func backBtnAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: false)
    }
    
    private func setNavi() {
        self.navigationController?.isNavigationBarHidden = false
        
    }
    private func setBackBtn() {
        var backBtn: UIBarButtonItem!
        backBtn = UIBarButtonItem(image: UIImage(named: "xIcon"), style: .plain, target: self, action: #selector(backBtnAction(_:))) //
        backBtn.tintColor = .darkNavy
        self.navigationItem.leftBarButtonItem  = backBtn
        
    }
    
    private func setLabel(){
        
        cheerLabel2.numberOfLines = 5
        cheerLabel2.lineBreakMode = .byWordWrapping
        
        cheerPointLabel.numberOfLines = 4
        
        cheerPointLabel2.numberOfLines = 5
        
        storeName.setupText(text: paramStoreName!, fontName: "SpoqaHanSans-Bold", size: 32.0, color: .black)
        cheerLabel.setupText(text: "음식점을 응원합니다.", fontName: "SpoqaHanSans-Regular", size: 32.0, color: .black)
        cheerLabel2.setupText(text: "지지서명은 메이커에게 큰 힘이 될 수 있습니다. \n또한 공유를 통해 더 많은 사람에게 확산 되면 \n응원한 음식점의 성장률이 올라갑니다.", fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        
        let attributedString = NSMutableAttributedString(string: "지금 응원하면 \n펀디토 머니 50P 적립 !", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Light", size: 20.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        attributedString.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Bold", size: 20.0)!, range: NSRange(location: 16, length: 4))
        
        cheerPointLabel.attributedText = attributedString
        
//        cheerPointLabel.setupText(text: "지금 응원하면 \n\n펀디토 머니 50P 적립 !", fontName: "SpoqaHanSans-Bold", size: 32.0, color: .black)
        
        
        cheerPointLabel2.setupText(text: "펀딩도 함께할 경우 해당 프로젝트성공 시\n500P를 더 받을 수 있습니다. 자세한사항은\n지지서명 포인트 정책 안내를 참고하세요", fontName: "SpoqaHanSans-Regular", size: 16.0, color: .black)
        
//        cheerLabel2.addLineSpacing(space: 2.0)
        
//                let attrString = NSMutableAttributedString(string: cheerLabel2.text!)
//                let paragraphStyle = NSMutableParagraphStyle()
//                paragraphStyle.lineSpacing = 4
//                attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
//                cheerLabel2.attributedText = attrString
//
    }
  
    private func setBtn() {
        cancelBtn.borderWidth = 1.0
        cancelBtn.borderColor = UIColor(white: 0.0, alpha: 0.16)
        cancelBtn.cornerRadius = 8
        cheerBtn.cornerRadius = 8
        cancelBtn.backgroundColor = UIColor.white
        cheerBtn.backgroundColor = UIColor.darkNavy
        
    }
}


//
//  MyFundingStatusVC.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class MyFundingStatusVC: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet var firstPopUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubviewToBack(self.arrowImage)
        setLableText()
        setupPopUpView()
        setupGestureRecognizer()
//        navigationController?.isNavigationBarHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = true
    }
    
    func setLableText() {
        let attributedStr = NSMutableAttributedString(string: questionLabel.text!)
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String as String) , value: UIFont.textStyle5, range: NSRange(location: 0,length: 10))
        
        let attributedStr2 = NSMutableAttributedString(string: "+13,500 원", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 51.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        attributedStr2.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Regular", size: 51.0)!, range: NSRange(location: 0, length: 1))
        attributedStr2.addAttribute(.font, value: UIFont(name: "SpoqaHanSans-Regular", size: 51.0)!, range: NSRange(location: 8, length: 1))
        
        let attributedStr3 = NSMutableAttributedString(string: "원금대비 170% 상승!", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Regular", size: 24.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        attributedStr3.addAttributes([
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 24.0)!,
          .foregroundColor: UIColor(red: 77.0 / 255.0, green: 75.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        ], range: NSRange(location: 5, length: 4))
        attributedStr3.addAttribute(.foregroundColor, value: UIColor.coral, range: NSRange(location: 9, length: 4))
        
        questionLabel.attributedText = attributedStr
        moneyLabel.attributedText = attributedStr2
        percentLabel.attributedText = attributedStr3
        
    }
    
}

extension MyFundingStatusVC {
  
  func setupPopUpView() {
    let frame = CGRect(x: 0, y: 673, width: self.view.frame.width, height: 637)
    firstPopUpView.frame = frame
    self.view.addSubview(firstPopUpView)
  }
  
  func setupGestureRecognizer() {
    let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
    
    pan.delegate = self
    self.firstPopUpView.addGestureRecognizer(pan)
  }
  
  
  /*
   1. 현재 터치 로케이션과 팝업 뷰의 y 좌표 대응
   2. 팬 제스쳐 가 끝났을때 팝업 뷰의 위치에서 최대 떠올랐을때와 아래로 내려갔을때로 이동하는 애니메이션
 
   */
  @objc func handlePanGesture(_ pan: UIPanGestureRecognizer) {
    
    let touchLocation = pan.location(in: self.view)
    let velocity = pan.velocity(in: self.view)
    
    switch pan.state {
      case .began:
        print("began")
      case .changed:
        self.firstPopUpView.frame.origin.y = touchLocation.y
      
      case .ended:
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
          if velocity.y > 0 {
            self.firstPopUpView.frame.origin.y = 673
          } else if velocity.y == 0 {
            
            //현재 마지막 팬 제스쳐 방향을 저장해두고 그 방향대로 뷰 위치 지정
          } else {
            self.firstPopUpView.frame.origin.y = 85
          }
        })
      default:
        print("default")
    }
  }
}

extension MyFundingStatusVC: UIGestureRecognizerDelegate {
  
}

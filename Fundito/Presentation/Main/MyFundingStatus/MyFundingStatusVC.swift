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
    
    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRecognizer.direction = .up
        setLableText()
        navigationController?.isNavigationBarHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
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
    
    @IBAction func swipeView(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            print("up")
            let vc = storyboard?.instantiateViewController(withIdentifier: "MyFundingStatusVC2") as! MyFundingStatusVC2
            print(vc)
            UIView.animate(withDuration: 0.2, animations: {
                UIView.setAnimationCurve(.linear)
                self.navigationController?.pushViewController(vc, animated: false)
                })
//                UIView.setAnimationTransition( UIView.AnimationTransition.curlDown , for: (self.navigationController?.view)!, cache: false)
            
            
//            self.navigationController?.pushViewController(vc, animated: true)
            
//            if let nextView = self.storyboard?.instantiateViewController(withIdentifier: "MyFundingStatusVC2"){
//                nextView.modalTransitionStyle = .coverVertical
//                self.present(nextView, animated: true, completion: nil)
//            }
        }
        
    }
    
    // for push test
    func setBtn(){
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = UIColor.green
        btn.setTitle("Click Me", for: .normal)
        btn.addTarget(self, action: #selector(self.push), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
    }
    
    
    // Set Custom Back Button
    func setBackBtn(){
        let backBTN = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(self.pop))
        
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    // push func
    @objc func push() {
       let vc = storyboard?.instantiateViewController(withIdentifier: "MyFundingStatusVC2") as! MyFundingStatusVC2
        
       self.navigationController?.pushViewController(vc, animated: true)
     }
    
    // pop func
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }

}

//class lineView: UIView {
//    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 10, y: 400))
//        path.addLine(to: CGPoint(x: 400, y: 400))
//        path.close()
//        path.lineWidth = 5.0
//        UIColor.gray.setStroke()
//        path.stroke()
//    }
//}

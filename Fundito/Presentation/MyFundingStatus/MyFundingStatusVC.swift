//
//  MyFundingStatusVC.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class MyFundingStatusVC: UIViewController {

    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = lineView(frame: self.view.frame)
        view.backgroundColor = .clear
        self.view.addSubview(view)
        swipeRecognizer.direction = .up
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
        // 백버튼 이미지 파일 이름에 맞게 변경해주세요.
//        let backBTN = UIBarButtonItem(image: UIImage(named: "backBtn"),
//                                      style: .plain,
//                                      target: self,
//                                      action: #selector(self.pop))
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

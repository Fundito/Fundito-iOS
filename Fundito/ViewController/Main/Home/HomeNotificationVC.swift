//
//  HomeNotificationVC.swift
//  Fundito
//
//  Created by kimhyeji on 1/3/20.
//  Copyright © 2020 Fundito. All rights reserved.
//

import UIKit

class HomeNotificationVC: UIViewController {

    
    //@IBOutlet weak var backBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi()
        self.navigationController?.isNavigationBarHidden = false
        // 이유는 모르겠으나 이 위치가 아니면 색깔이 안변함
        navigationController?.navigationBar.barTintColor =
        UIColor(displayP3Red: 247.0/255.0, green:  248.0/255.0, blue: 250.0/255.0, alpha: 1.0)

        setBackBtn()
        setNaviImage()
    }
    
   
    
}


extension HomeNotificationVC {
    
    @objc func backBtnAction(_ sender: UIBarButtonItem) {
           self.navigationController?.popViewController(animated: false)
       }
    
    private func setNavi() {
        self.navigationController?.isNavigationBarHidden = false
        // navi background color
        navigationController?.navigationBar.barTintColor =
            UIColor(displayP3Red: 247.0/255.0, green:  248.0/255.0, blue: 250.0/255.0, alpha: 1.0)

    }
    private func setBackBtn() {
        var backBtn: UIBarButtonItem!
        backBtn = UIBarButtonItem(image: UIImage(named: "backarrowNavyIcon"), style: .plain, target: self, action: #selector(backBtnAction(_:))) //
        backBtn.tintColor = .darkNavy
        self.navigationItem.leftBarButtonItem  = backBtn
        
    }
    
    private func setNaviImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "noticeIconOn")
        imageView.image = image
//        self.navigationController?.navigationBar.
        self.navigationItem.titleView = imageView
    }

}

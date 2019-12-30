//
//  MainTabBarController.swift
//  Fundito
//
//  Created by kimhyeji on 12/31/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
}

// 버튼 클릭시 이미지 변경 구현 필요

extension MainTabBarController: UITabBarControllerDelegate{
    
    func setTabBar(){
        mainTabBar.shadowOffsetExtension = CGSize(width: 0, height: -3)
        mainTabBar.shadowColorExtension = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.13)
        mainTabBar.shadowOpacity = 10.0
        mainTabBar.backgroundColor = .white
    }
    
    func tabBarController(_: UITabBarController, shouldSelect: UIViewController) -> Bool{
        print("tab selected ????")
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tab selected")
    }
}


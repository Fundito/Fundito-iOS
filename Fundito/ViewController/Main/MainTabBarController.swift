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
        self.delegate = self
        setTabBar()
    }
    
}


extension MainTabBarController: UITabBarControllerDelegate{
    
    func setTabBar(){
        mainTabBar.shadowOffsetExtension = CGSize(width: 0, height: -3)
        mainTabBar.shadowColorExtension = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.13)
        mainTabBar.shadowOpacity = 10.0
        mainTabBar.backgroundColor = .white
        mainTabBar.tintColor = .darkNavy
        mainTabBar.unselectedItemTintColor = .darkNavy
  
    }
    
    func tabBarController(_: UITabBarController, shouldSelect: UIViewController) -> Bool{
        return true
    }
    
    // 탭바 클릭 시에 이벤트 주고 싶을 때 사용하는 func
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    
    }
}


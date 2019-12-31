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
// 시작할 때 Home을 클릭 상태로 인식하도록 해야함

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
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
//        let tabIndex = tabBarController.selectedIndex
        
//        let selectedTitle = tabBar.selectedItem?.title
//        var image = selectedTitle ?? ""
//        image += "TabIconActive"
//        print(image)
//
//        print(tabBar.selectedItem?.title ?? "nil")
//        print(tabBarController.selectedIndex)
        
//        switch (tabIndex) {
//        case 0: tabBar.selectedItem?.selectedImage = UIImage(named: "homeTabIconActive")
//        case 1: tabBar.selectedItem?.selectedImage = UIImage(named: "feedTabIconActive")
//        case 2: tabBar.selectedItem?.selectedImage = UIImage(named: "myfundTabIconActive")
//        case 3: tabBar.selectedItem?.selectedImage = UIImage(named: "moreTabIconActive")
//        default:
//            print("default")
//        }
    
    }
}


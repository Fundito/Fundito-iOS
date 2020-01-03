//
//  FeedFriendListVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class FeedFriendListVC: UIViewController{

    @IBOutlet weak var ditoOfMonth: UIView!
    @IBOutlet weak var ditoOfMonth2: UIView!
    @IBOutlet weak var ditoOfMonth3: UIView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            initView()
        
        }
}

extension FeedFriendListVC {
    
    private func initView(){
        ditoOfMonth.borderWidth = 1
        ditoOfMonth2.borderWidth = 1
        ditoOfMonth3.borderWidth = 1
        
        ditoOfMonth.borderColor = .blueberry
        ditoOfMonth2.borderColor = .blueberry
        ditoOfMonth3.borderColor = .blueberry
        
        ditoOfMonth.cornerRadius = 8
        ditoOfMonth2.cornerRadius = 8
        ditoOfMonth3.cornerRadius = 8
    }
    
}

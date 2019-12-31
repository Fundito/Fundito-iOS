//
//  HomeVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    
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
        setupView()
    }
    
    func setupView(){
//        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "homeBgrImg") ?? nil)!)
    }
}


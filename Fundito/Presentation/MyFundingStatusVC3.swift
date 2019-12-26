//
//  MyFundingStatusVC3.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class MyFundingStatusVC3: UIViewController {

    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRecognizer.direction = .down
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            // none
        } else if sender.direction == .down {
            print("down(pop)")
            UIView.animate(withDuration: 0.2, animations: {
                UIView.setAnimationCurve(.easeInOut)
                self.navigationController?.popViewController(animated: false)
            })
        }
    }
    

}

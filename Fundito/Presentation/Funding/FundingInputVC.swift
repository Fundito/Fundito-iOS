//
//  FundingInputVC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class FundingInputVC : UIViewController{
	
}

// MARK: Lifecycle
extension FundingInputVC{
	override func viewDidLoad() {
		super.viewDidLoad()
		initView()

        view.backgroundColor = .clear
        self.view.addSubview(view)
	}
}
// MARK: Initialization
extension FundingInputVC{
	private func initView(){
		
	}
}



class lineView: UIView {
    func draw(_ rect: CGRect, start: CGPoint, end: CGPoint, lineWidth: CGFloat, strokeColor: UIColor ) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        path.lineWidth = lineWidth
        strokeColor.setStroke()
        path.stroke()

    }
}

//        let view = lineView.draw(CGRect, start: CGPoint(x: 55.5, y: 114.5), end: CGPoint(x: 55.5, y: 378.5), lineWidth: 1.0, strokeColor: UIColor.greyish)

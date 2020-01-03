//
//  FundingProgressView.swift
//  Fundito
//
//  Created by 문명주 on 01/01/2020.
//  Copyright © 2020 Fundito. All rights reserved.
//

import UIKit

//@IBDesignable
class FundingProgressView : UIView{
	
	let circleCount = 25
	let circleRadius : CGFloat = 2.5
	let max = 100
	
	var progress: Int = 50{
		didSet{
			setNeedsDisplay()
		}
	}
	
	override var intrinsicContentSize: CGSize{
		return CGSize(width: UIView.noIntrinsicMetric, height: 18)
	}
	
	override func draw(_ rect: CGRect) {
		
		let circleSpacing: CGFloat = rect.width / CGFloat(circleCount + 1)
		
		let targetIndex = Int((Float(progress) / Float(max)) * Float(circleCount)) - 1 // 0~25
		
		for i in 0..<circleCount{
			let circleCenterX : CGFloat = circleSpacing * CGFloat(i) + circleRadius
			let circleCenterY : CGFloat = rect.height / 2
			
			let circle = UIBezierPath(ovalIn: CGRect(x: circleCenterX, y: circleCenterY, width: circleRadius * 2, height: circleRadius * 2))
			
			if i > targetIndex{
				UIColor.coral.setFill()
			}else{
				UIColor.darkNavy.setFill()
			}
			
			circle.fill()
			
			if i == targetIndex{
				let targetCircle = UIBezierPath(ovalIn: CGRect(x: circleCenterX - circleRadius * 0.25, y: circleCenterY - circleRadius * 0.25, width: circleRadius * 2.5, height: circleRadius * 2.5))
				UIColor.darkNavy.setFill()
				targetCircle.fill()
				
				let targetStroke = UIBezierPath(ovalIn: CGRect(x: circleCenterX - circleRadius , y: circleCenterY - circleRadius, width: circleRadius * 4, height: circleRadius * 4))
				targetStroke.lineWidth = 1
				UIColor.darkNavy.setStroke()
				targetStroke.stroke()
			}
			
			
		}
	}
}

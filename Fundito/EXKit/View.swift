//
//  View.swift
//  Fundito
//
//  Created by 문명주 on 28/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

extension UILabel{
	func addShadowToText(){
		self.layer.shadowColor = self.textColor.cgColor
		self.layer.shadowOffset = CGSize(width: 0, height: 0)
		
		self.layer.shadowRadius = 3.0
		self.layer.shadowOpacity = 0.7
		
		self.layer.masksToBounds=false
		self.layer.shouldRasterize=true
	}
	func removeShadowFromText(){
		self.layer.shouldRasterize=false
	}
    
    func setupText(text: String, fontName: String, size: CGFloat, color: UIColor) {
        self.attributedText = NSMutableAttributedString(string: text , attributes: [
          .font: UIFont(name: fontName, size: size)!,
          .foregroundColor: color
        ])
    }
    
    func addLineSpacing(space: CGFloat){
        let attrString = NSMutableAttributedString(string: self.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
  
    
}
extension UIButton{
	@IBInspectable
	var imageContentModeAspectFit : Bool{
		get{
			return self.imageView?.contentMode  == ContentMode.scaleAspectFit
		}
		set(newValue){
			if newValue{
				self.imageView?.contentMode = ContentMode.scaleAspectFit
			}
		}
	}
}
extension UIView{
	@IBInspectable var scale : CGFloat{
		get{
			return -1.0
		}
		set(value){
			self.transform = CGAffineTransform(scaleX: value, y: value)
		}
	}
}
extension UIView {
	func applyGradient(colours: [UIColor]) -> Void {
		self.applyGradient(colours: colours, locations: nil)
	}
	
	func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
		let gradient: CAGradientLayer = CAGradientLayer()
		gradient.frame = self.bounds
		gradient.colors = colours.map { $0.cgColor }
		gradient.locations = locations
		self.layer.insertSublayer(gradient, at: 0)
	}
}
extension UIView {
	@IBInspectable
	var zOrder : Int{
		get{
			return Int(layer.zPosition)
		}
		set(value){
			layer.zPosition = CGFloat(value)
		}
	}
	
	@IBInspectable
	var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}
	
	@IBInspectable
	var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
	@IBInspectable
	var borderColor: UIColor? {
		get {
			if let color = layer.borderColor {
				return UIColor(cgColor: color)
			}
			return nil
		}
		set {
			if let color = newValue {
				layer.borderColor = color.cgColor
			} else {
				layer.borderColor = nil
			}
		}
	}
	
	@IBInspectable
	var shadowRadius: CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.shadowRadius = newValue
		}
	}
	
	@IBInspectable
	var shadowOpacity: Float {
		get {
			return layer.shadowOpacity
		}
		set {
			layer.shadowOpacity = newValue
		}
	}
	
	@IBInspectable
	var shadowOffsetExtension: CGSize {
		get {
			return layer.shadowOffset
		}
		set {
			layer.shadowOffset = newValue
		}
	}
	
	@IBInspectable
	var shadowColorExtension: UIColor? {
		get {
			if let color = layer.shadowColor {
				return UIColor(cgColor: color)
			}
			return nil
		}
		set {
			if let color = newValue {
				layer.shadowColor = color.cgColor
			} else {
				layer.shadowColor = nil
			}
		}
	}
}

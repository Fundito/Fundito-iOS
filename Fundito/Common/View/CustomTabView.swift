//
//  CustomTabView.swift
//  Fundito
//
//  Created by 문명주 on 01/01/2020.
//  Copyright © 2020 Fundito. All rights reserved.
//

import UIKit

protocol CustomTabViewDelegate : class{
	func onTabSelected(pos: Int)
}

//@IBDesignable
class CustomTabView : UIView{
	
	weak var delegate: CustomTabViewDelegate?
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	var curIndex: Int = 0{
		didSet{
			
		}
	}
	
	private lazy var stack: UIStackView = {
		let v = UIStackView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.alignment = .fill
		v.axis = .horizontal
		v.distribution = .fillEqually
		return v
	}()
	
	private lazy var tab1 : UIButton = {
		let v = UIButton()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.setTitle("투자중인 음식점", for: .normal)
		v.setTitleColor(UIColor.black, for: .normal)
		v.titleLabel?.font = UIFont.textStyle3
		v.setTitleColor(UIColor.lightGray, for: .highlighted)
		v.addTarget(self, action: #selector(tab1Tapped), for: .touchUpInside)
		return v
	}()
	private lazy var tab2 : UIButton = {
		let v = UIButton()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.setTitle("투자완료된  음식점", for: .normal)
		v.setTitleColor(UIColor.darkNavy, for: .normal)
		v.setTitleColor(UIColor.lightGray, for: .highlighted)
		v.titleLabel?.font = UIFont.textStyle3
		v.addTarget(self, action: #selector(tab2Tapped), for: .touchUpInside)
		return v
	}()
	
	private lazy var indicator : UIView = {
		let v = UIView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.heightAnchor.constraint(equalToConstant: 2).isActive = true
		v.backgroundColor = UIColor.darkNavy
		return v
	}()
	
	override var intrinsicContentSize: CGSize{
		return CGSize(width: UIView.noIntrinsicMetric, height: 44)
	}
	
	private var indicatorWidthConstraint: NSLayoutConstraint!
	private var indicatorLeadingConstraint: NSLayoutConstraint!
	
	var firstSet = false
	override func layoutSubviews() {
		super.layoutSubviews()
		
		guard !firstSet else { return }
		firstSet = true
		indicatorWidthConstraint.constant = bounds.width/2
	}
	
	private func setup(){
		
		addSubview(indicator)
		stack.addArrangedSubview(tab1)
		stack.addArrangedSubview(tab2)
		addSubview(stack)
		
		indicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		indicatorLeadingConstraint = indicator.leadingAnchor.constraint(equalTo: leadingAnchor)
		indicatorLeadingConstraint.isActive = true
		indicatorWidthConstraint = indicator.widthAnchor.constraint(equalToConstant: 0)
		indicatorWidthConstraint.isActive = true
		
		stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
		stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	@objc private func tab1Tapped(){
		delegate?.onTabSelected(pos: 0)
        print("tab1Tapped")
		UIView.animate(withDuration: 0.25, animations:{[unowned self] in
			self.indicatorWidthConstraint.constant = self.frame.width/3 * 2
			self.layoutIfNeeded()
			}, completion: { b in
				UIView.animate(withDuration: 0.25){[unowned self] in
					self.indicatorWidthConstraint.constant = self.frame.width/2
					self.layoutIfNeeded()
				}
		})
		UIView.animate(withDuration: 0.5){[unowned self] in
			self.indicatorLeadingConstraint.constant = 0
			self.layoutIfNeeded()
		}
		tab1.setTitleColor(UIColor.black, for: .normal)
		tab2.setTitleColor(UIColor.darkNavy, for: .normal)
		curIndex = 0
	}
	@objc private func tab2Tapped(){
		delegate?.onTabSelected(pos: 1)
        print("tab2Tapped")
		UIView.animate(withDuration: 0.25, animations:{[unowned self] in
			self.indicatorWidthConstraint.constant = self.frame.width/3 * 2
			self.layoutIfNeeded()
			}, completion: { b in
				UIView.animate(withDuration: 0.25){[unowned self] in
					self.indicatorWidthConstraint.constant = self.frame.width/2
					self.layoutIfNeeded()
				}
		})
		
		UIView.animate(withDuration: 0.5){[unowned self] in
			self.indicatorLeadingConstraint.constant = self.frame.width/2
			self.layoutIfNeeded()
		}
		tab1.setTitleColor(UIColor.darkNavy, for: .normal)
		tab2.setTitleColor(UIColor.black, for: .normal)
		curIndex = 1
	}
}

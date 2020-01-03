//
//  NumberParsingExtension.swift
//  Fundito
//
//  Created by 문명주 on 24/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation

/**
Money Format으로 콤마가 들어간 문자열에 새로운 문자를 입력할 때 다음 문자열을 반환해준다

예를 들어, 100,000 에 0을 입력하면 1,000,000 을 반환해준다
*/
extension String{
	func addCharForMoneyRepresentation(_ nextChar : String) -> String{
		var src = self
		
		src.removeAll(where: {c in
			[" ",","].contains(c)
		})
		
		guard let intValue = Int(src) else {
			fatalError("a src string cannot be converted to integer")
		}
		
		guard let newCharIntValue = Int(nextChar) else{
			fatalError("nextChar can be only a number ASCI character")
		}
		
		return (intValue * 10 + newCharIntValue).moneyRepresentation
		
	}
}

extension Int{
	/**
	Int값인 숫자에 3단위마다 콤마(,)를 추가해준 문자열을 반환한다.
	
	A [String] converted with source int value adding comma separation
	*/
	var moneyRepresentation : String{
		var src : [Character] = "\(self)".reversed()
		
		let willAddedCommaCount = (src.count - 1) / 3
		
		for i in 0..<willAddedCommaCount{
			src.insert("," , at: (i + 1) * 3 + i)
		}
		
		var result = ""
		
		for c in src.reversed(){
			result += "\(c)"
		}
		
		return result
	}
}

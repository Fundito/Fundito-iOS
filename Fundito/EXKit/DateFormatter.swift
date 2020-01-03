//
//  DateFormatter.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation

extension DateFormatter{
	static let iso8601Full: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		
		return formatter
	}()
}

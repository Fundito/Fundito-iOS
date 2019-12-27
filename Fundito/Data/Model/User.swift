//
//  User.swift
//  Fundito
//
//  Created by 문명주 on 26/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation

struct User : Codable{
	
	var result : String
	var ecode : Int
	var message : String
	
	enum CodingKeys : String, CodingKey{
		case result = "success"
		case ecode = "ecode"
		case message = "message"
	}
	
}

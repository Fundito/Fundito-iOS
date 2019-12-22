//
//  AppModel.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation

final class AppModel{
	
	/**
	Private Constructor for Singleton
	*/
	private init(){}
	
	/**
	Singleton Instance
	*/
	static let shared = AppModel()
	
	private let ud = UserDefaults.standard
	
	var authToken : String{
		get{
			return ud.string(forKey: "authToken") ?? ""
		}set{
			ud.set(newValue, forKey: "authToken")
		}
	}
	
	
	
}

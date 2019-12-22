//
//  NotiUtil.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation

typealias Callback = ([AnyHashable: Any]) -> Void
class NotiUtil{
	
	private static var eventQueue : [(Any, String, Callback)] = []
	
	static func register(_ observer : Any, _ name : String, _ callback : @escaping Callback){
		eventQueue.append((observer, name, callback))
		NotificationCenter.default.addObserver(observer, selector: #selector(received(_:)), name: NSNotification.Name.init(name), object: nil)
	}
	static func unregister(_ observer : Any){
		eventQueue.removeAll{ o in
			return (observer as? NSObject) === (o.0 as? NSObject)
		}
	}
	
	@objc
	static func received(_ noti : NSNotification){
		for event in eventQueue{
			if event.1 == noti.name.rawValue{
				event.2(noti.userInfo ?? [:])
			}
		}
	}
	
	static func post(_ name : String, datas : [AnyHashable: Any]){
		NotificationCenter.default.post(name: NSNotification.Name.init(name), object: nil, userInfo: datas)
	}
}

//
//  AppService.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

final class AppService {
	
	static func POST<T>(endPoint: String, params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.request(endPoint: Service.environment.apiHostURLString + endPoint, method: .post, params: params, keyPath: keyPath)
	}
	
	static func GET<T>(endPoint: String, params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.request(endPoint: Service.environment.apiHostURLString + endPoint, method: .get, params: params, keyPath: keyPath)
	}
	
	static func PUT<T>(endPoint: String, params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.request(endPoint: Service.environment.apiHostURLString + endPoint, method: .put, params: params, keyPath: keyPath)
	}
	
	static func PATCH<T>(endPoint: String, params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.request(endPoint: Service.environment.apiHostURLString + endPoint, method: .patch, params: params, keyPath: keyPath)
	}
	
	static func DELETE<T>(endPoint: String, params: Parameters? = nil, fields: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.request(endPoint: Service.environment.apiHostURLString + endPoint, method: .delete, params: params, fields: fields, keyPath: keyPath)
	}
	
	static func POST<T>(endPoint: String, files: [UploadFile], params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.upload(endPoint: Service.environment.apiHostURLString + endPoint, method: .post, files: files, params: params, keyPath: keyPath)
	}
	
	static func PUT<T>(endPoint: String, files: [UploadFile], params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		return Service.upload(endPoint: Service.environment.apiHostURLString + endPoint, method: .put, files: files, params: params, keyPath: keyPath)
	}
	
}

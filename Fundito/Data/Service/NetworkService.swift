//
//  NetworkService.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

enum ServiceEnvironment: String, CaseIterable, Codable {
	case dev, live
	
	var name: String {
		switch self {
			case .dev : return "development"
			case .live: return "production"
		}
	}
	
	var apiHostURLString: String {
		switch self {
			case .dev : return "DEV URL"
			case .live: return "LIVE URL"
		}
	}
	
}


final class Service {
	
	static public var environment = ServiceEnvironment.dev
	
	static func request<T>(endPoint: String, method: HTTPMethod, params: Parameters? = nil, fields: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		var urlString = endPoint
		let headers: HTTPHeaders = ["Content-Type": "application/json",
									"Accept-Language": Locale.current.languageCode ?? "",
									"Authorization": "JWT \(AppModel.shared.authToken)"]
		var parameters = params
		var queryString = ""
		
		if method == .get || method == .delete {
			if let params = params {
				queryString = params.compactMap({ "\($0)=\($1)" }).joined(separator: "&")
				urlString += "?\(queryString)"
			}
			parameters = fields
		}
		
		let sessionManager = Alamofire.SessionManager.default
		sessionManager.session.configuration.timeoutIntervalForRequest = 8
		
		return sessionManager.request(urlString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
			.validate(contentType: ["application/json"])
			.responseData().then { (data, response) -> Promise<T> in
				
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
				
				// 호출결과 에러값이 오는 경우
				if let serviceError = try? decoder.decode(ServiceError.self, from: data) {
					if !serviceError.success {
						if serviceError.needsHandleError {
						}
						throw serviceError
					}
				}
				
				do {
					let value = try decoder.decode(T.self, from: data, keyPath: keyPath)
					return .value(value)
				} catch {
					throw error
				}
		}
	}
	
	
	
	static func upload<T>(endPoint: String, method: HTTPMethod, files: [UploadFile], params: Parameters? = nil, keyPath: String? = nil) -> Promise<T> where T: Decodable {
		let urlString = endPoint
		let headers: HTTPHeaders = ["Content-Type": "application/json",
									"Accept-Language": Locale.current.languageCode ?? "",
									"Authorization": "Bearer \(AppModel.shared.authToken)"]
		
		return Promise { seal in
			Alamofire.upload(
				multipartFormData: { multipartFormData in
					
					if let params = params {
						for (key, value) in params {
							if value is String || value is Int {
								multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
							}
						}
					}
					
					for file in files {
						multipartFormData.append(file.data, withName: file.name, fileName: file.fileName, mimeType: file.mimeType)
					}
					
			},
				to: urlString,
				method: method,
				headers: headers) { (encodingResult) in
					
					switch encodingResult {
						case .success(let upload, _, _):
							upload.uploadProgress(closure: { progress in
								
							})
							upload.responseJSON { response in
								
								guard let data = response.data else {
									seal.reject(GTError.canNotParseJSON)
									return
								}
								
								let decoder = JSONDecoder()
								decoder.keyDecodingStrategy = .convertFromSnakeCase
								decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
								//                            decoder.dateDecodingStrategy = .millisecondsSince1970
								
								// 호출결과 에러값이 오는 경우
								if let serviceError = try? decoder.decode(ServiceError.self, from: data) {
									if !serviceError.success {
										if serviceError.needsHandleError {
											
										}
										seal.reject(serviceError)
									}
								}
								
								do {
									let value = try decoder.decode(T.self, from: data, keyPath: keyPath)
									seal.fulfill(value)
								} catch {
									seal.reject(error)
								}
								
						}
						
						case .failure(let encodingError):
							seal.reject(encodingError)
					}
			}
		}
	}
	
}



struct UploadFile {
	var data: Data!
	var name = ""
	var fileName = ""
	var mimeType = ""
}




//
// 결과값이 불필요한 경우에 Promise<Void>를 사용하면
// AppService.request<T> 메소드를 통해 일반화하기 힘들기에 비어있는 Decodable struct 활용
//
struct VoidResult: Decodable {
}


//
// Promise<Void> 리턴시 `return .void` 형식으로 간략화하기 위한 처리 (`return Promise(value: ())` 와 동일)
// 참고: https://github.com/mxcl/PromiseKit/issues/532
//
extension Promise {
	static var voidResult: Promise<VoidResult> {
		return .value(VoidResult())
		//        return Promise<VoidResult>(value: VoidResult())
	}
}



protocol ServiceErrorHandler {
	
	func handleServiceError(_ error: ServiceError)
	
}

struct ServiceError: Decodable, Error, LocalizedError {
	
	var success = false
	var ecode = 0
	var message = ""
	
	var errorDescription: String? { return message }
	
	var needsHandleError: Bool {
		get {
			return needsReissueTokens || needsLogin
		}
	}
	
	var needsSilentFail: Bool {
		get {
			return needsReissueTokens
		}
	}
	
	var needsReissueTokens: Bool {
		get {
			//            return resultCode == 2203 // 만료된 토큰 (Refresh Token 사용하여 재발급 요청 필요)
			return false
		}
	}
	
	var needsLogin: Bool {
		get {
			//            return resultCode == 2200 // 토큰 인증 실패
			//                || resultCode == 2201 // 헤더에 토큰이 비어 있는 경우
			//                || resultCode == 2202 // 유효하지 않은 토큰
			return false
		}
	}
	
}


protocol GTErrorHandler {
	func handleGTError(_ error: GTError)
}


enum GTError: LocalizedError {
	
	case canNotParseJSON
	case notAllowed
	case facebookLoginFailed
	case googleLoginFailed
	
	var errorDescription: String? {
		get {
			switch self {
				case .canNotParseJSON: return NSLocalizedString("알 수 없는 결과값입니다.", comment: "")
				case .notAllowed: return NSLocalizedString("사용이 제한된 기능입니다.", comment: "")
				default: return NSLocalizedString("요청을 처리할 수 없습니다.", comment: "")
			}
		}
	}
}




extension String {
	var fullDataURL: URL? {
		get {
			return self.isEmpty ? nil : URL(string: self)
		}
	}
}




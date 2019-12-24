//
//  FunctionTest.swift
//  FunditoTests
//
//  Created by 문명주 on 24/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import XCTest
@testable import Fundito

class FunctionTest: XCTestCase {
	
	override func setUp() {
		print("setup")
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		print("tearDown")
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testMoneyRepresentation() {
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		
		XCTAssertEqual(0.moneyRepresentation, "0")
		XCTAssertEqual(1.moneyRepresentation, "1")
		XCTAssertEqual(10.moneyRepresentation, "10")
		XCTAssertEqual(100.moneyRepresentation, "100")
		XCTAssertEqual(1000.moneyRepresentation, "1,000")
		XCTAssertEqual(10000.moneyRepresentation, "10,000")
		XCTAssertEqual(999999.moneyRepresentation, "999,999")
		XCTAssertEqual(1_000_000.moneyRepresentation, "1,000,000")
		XCTAssertEqual(999999.moneyRepresentation, "999,999")
		
	}
	
	func testAddCharForMoneyRepresentation() {
		XCTAssertEqual("0".addCharForMoneyRepresentation("1"), "1")
		XCTAssertEqual("10".addCharForMoneyRepresentation("1"), "101")
		XCTAssertEqual("100".addCharForMoneyRepresentation("1"), "1,001")
		XCTAssertEqual("1,000,000".addCharForMoneyRepresentation("1"), "10,000,001")
		XCTAssertEqual("999,999".addCharForMoneyRepresentation("1"), "9,999,991")
	}
	
}

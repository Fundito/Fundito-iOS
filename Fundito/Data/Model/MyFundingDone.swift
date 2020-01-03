//
//  MyFundingDone.swift
//  Fundito
//
//  Created by kimhyeji on 1/3/20.
//  Copyright © 2020 Fundito. All rights reserved.
//

import Foundation

struct MyFundingDone {

    // var storeIdx: Int
    var storeName: String
    var dueDate: String
    var fundingMoney: Int
    var refundMoney: Int

    init(storeName: String, dueDate: String, fundingMoney: Int, refundMoney: Int) {
        self.storeName = storeName
        self.dueDate = dueDate
        self.fundingMoney = fundingMoney
        self.refundMoney = refundMoney
    }

}

//
//  MyFundingProgress.swift
//  Fundito
//
//  Created by kimhyeji on 1/3/20.
//  Copyright © 2020 Fundito. All rights reserved.
//

import Foundation
import UIKit

struct MyFundingProgress {

    // var storeIdx: Int
    var storeName: String
    var remainingDays: Int
    var progressPercent: String

    init(storeName: String, remainingDays: Int, progressPercent: String) {
        self.storeName = storeName
        self.remainingDays = remainingDays
        self.progressPercent = progressPercent
    }

}

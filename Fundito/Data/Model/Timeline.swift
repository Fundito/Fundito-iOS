//
//  Timeline.swift
//  Fundito
//
//  Created by kimhyeji on 1/3/20.
//  Copyright © 2020 Fundito. All rights reserved.
//

import Foundation
import UIKit

struct Timeline {

    var fundingMoney: String
    var arrowImage: UIImage?
    var userName: String
    var elapsedTime: String

    init(money: String, imageName: String, userName: String, elapsedName: String) {
        self.fundingMoney = money
        self.arrowImage = UIImage(named: imageName)
        self.userName = userName
        self.elapsedTime = elapsedName
    }

}


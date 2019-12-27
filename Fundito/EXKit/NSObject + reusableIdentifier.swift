//
//  NSObject + reusableIdentifier.swift
//  Fundito
//
//  Created by kimhyeji on 12/26/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

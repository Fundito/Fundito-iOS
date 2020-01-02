//
//  PasswordTextField.swift
//  Fundito
//
//  Created by kimhyeji on 12/31/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit

class PasswordTextField: UITextField {

  override func deleteBackward() {
    super.deleteBackward()
    NotificationCenter.default.post(name: .init("deletePressed"), object: nil)
  }

}

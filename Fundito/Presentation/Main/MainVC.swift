//
//  ViewController.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//


import UIKit
import PromiseKit
import FBSDKCoreKit
import FBSDKLoginKit

class MainVC : UIViewController{

	override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBLoginButton()
        loginButton.permissions = ["email"]
        loginButton.center = view.center
        view.addSubview(loginButton)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAccessToken()
    }

    func getAccessToken() {
        guard let token = AccessToken.current else { return }
        print ("#### AccessToken ####")
        print(token)
        print ("#### AccessToken ####")
    }
}


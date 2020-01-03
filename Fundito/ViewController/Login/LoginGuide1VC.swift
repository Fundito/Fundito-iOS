//
//  LoginGuide1VC.swift
//  Fundito
//
//  Created by 문명주 on 27/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit
import PromiseKit
import FBSDKLoginKit
import FBSDKCoreKit

// (페이스북) 로그인 안됨

class LoginGuide1VC : UIViewController{

    @IBOutlet weak var loginButton: FBLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.permissions = ["public_profile","email"]
        loginButton.backgroundColor = .darkNavy
        loginButton.cornerRadius = 8
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAccessToken()
        getUserDetails()
    }

    func getAccessToken() {
        guard let token = AccessToken.current else { return }
        print ("#### AccessToken ####")
        print(token)
        print ("#### AccessToken ####")
    }

    func getUserDetails(){
        guard let tokenString = AccessToken.current?.tokenString else{
            return
        }

        if(AccessToken.current != nil){
            GraphRequest(graphPath: "me",parameters: ["fields": "id, name, email"],
                         tokenString: tokenString, version: nil,
                         httpMethod: .get).start(completionHandler: { (connection, graphResult, error) in
                guard let Info = graphResult as? [String: Any] else { return }

                if let userName = Info["name"] as? String
                    { print(userName) }
            })
        }
    }
}

extension LoginGuide1VC : LoginButtonDelegate{

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        /**
        만약 페이스북 로그인이 실패했다면,
        */
        guard error == nil else {
            return
        }

        Profile.loadCurrentProfile{[unowned self] profile, error in
            guard error == nil else {
                return
            }
            if let profile = profile{
                let name = profile.name ?? ""
                let avatarUrlString = profile.imageURL(forMode: .square, size: CGSize(width: 256, height: 256))?.absoluteString ?? ""
            }else{

            }
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Log out")
    }
}

//FBSDKSettings.setAutoLogAppEventsEnabled(true)
//FBSDKSettings.setAdvertiserIDCollectionEnabled(true);

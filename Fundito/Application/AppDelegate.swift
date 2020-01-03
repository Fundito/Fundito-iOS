//
//  AppDelegate.swift
//  Fundito
//
//  Created by 문명주 on 22/12/2019.
//  Copyright © 2019 Fundito. All rights reserved.
//

import UIKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Thread.sleep(forTimeInterval: 3.0)
        //sleep(3)
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = ApplicationDelegate.shared.application(app, open:url, sourceApplication: (options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String), annotation:  options[UIApplication.OpenURLOptionsKey.annotation])
        return handled
    }

}


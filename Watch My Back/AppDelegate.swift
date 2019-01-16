//
//  AppDelegate.swift
//  Watch My Back
//
//  Created by Darrel Muonekwu on 1/12/19.
//  Copyright © 2019 Darrel Muonekwu. All rights reserved.
//

import UIKit
import Firebase
import SmartcarAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // global variable in the app's AppDelegate
    var smartcarSdk: SmartcarAuth? = nil
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
        -> Bool {
            FirebaseApp.configure()
            return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // this is the url that was redirected from when the which is how you got back to your app
    window!.rootViewController?.presentedViewController?.dismiss(animated: true , completion: nil)
        print(url)
        smartcarSdk!.handleCallback(with: url)
        
        return true
        
    }
}

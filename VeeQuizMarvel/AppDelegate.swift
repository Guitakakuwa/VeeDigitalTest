//
//  AppDelegate.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/22/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        sleep(3)
        return true
    }

    private func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation:[:])
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,sourceApplication: sourceApplication,annotation: annotation)
    }
}




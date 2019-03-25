
//
//  LoginController.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/22/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


var userLoggedIn:Bool = false;
let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
let heroesVC = storyBoard.instantiateViewController(withIdentifier: "listHeroes") as! HeroesTableViewController
let welcomeVC = storyBoard.instantiateViewController(withIdentifier: "welcome") as! WelcomeVC


class LoginController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        heroesVC.loadHeroes()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        let loginButton = GIDSignInButton(frame: CGRect(x: 150, y: 700, width: 100, height: 100))
        view.addSubview(loginButton)
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            // show user the error message
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            userLoggedIn = true
            welcomeVC.profileName = user.profile.givenName
            self.present(welcomeVC, animated:true, completion:nil)
            if let error = error {
                print(error)
                return
            }
        }
    }

}


//
//  WelcomeVC.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/23/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class WelcomeVC:UIViewController{
    
    var profileName:String = ""
    @IBOutlet var userName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = profileName
    }
    
    //voltar pra tela de login
    @IBAction func unwind(unwindSegue:UIStoryboardSegue) {
        
    }
    //mostrar ShamVC
    @IBAction func showLogin(_ sender: Any) {
       try? Auth.auth().signOut()
        
            }
        }

    
    
    
    
    
    
    
    


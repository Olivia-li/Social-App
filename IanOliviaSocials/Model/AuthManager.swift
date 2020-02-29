
//
//  authenticationManager.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-27.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit
import Firebase

let auth = AppManager.auth
let db = AppManager.db

class AuthManager{
    
    static func handleLogin(_ username: String, _ password: String, _ vc: UIViewController) {
        let username = username
        let password = password
        
        //Spec asked for login with username not email fix later
        auth.signIn(withEmail: username, password: password) { (user, error) in
            guard error == nil else {
                util.displayAlert(title: "Error", message: "login error", vc: vc)
                return
            }
            guard user != nil else {
                util.displayAlert(title: "Error", message: "user field cannot be empty", vc: vc)
                return
            }
            UserDefaults.standard.set(true, forKey: "usersignedin")
            UserDefaults.standard.synchronize()
            AppManager.currUser = Profile(auth.currentUser!.uid)
            print(AppManager.currUser.name)
            vc.performSegue(withIdentifier: "LoginVCtoNC", sender: vc)
        }
    }
    
    static func handleRegister(_ name:String, _ username:String, _ email:String, _ password:String, _ vc: UIViewController) {
        let name = name
        let username = username
        let email = email
        let password = password

        auth.createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                util.displayAlert(title: "Error", message: error.debugDescription, vc: vc)
                return
            }
            guard user != nil else {
                util.displayAlert(title: "Error", message: "No user", vc: vc)
                return
            }
            let usersNode = db.child("Users")
            let userNode = usersNode.child(auth.currentUser!.uid)
            userNode.updateChildValues(["name": name, "email": email, "username": username])
            AppManager.currUser = Profile(auth.currentUser!.uid)
            vc.performSegue(withIdentifier: "SignupVCtoNC", sender: vc)
        }
    }

}

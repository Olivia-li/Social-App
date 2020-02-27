
//
//  authenticationManager.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-27.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit

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
            AppManager.currUser = Profile(auth.currentUser!)
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
            let newUserId = usersNode.childByAutoId().key
            let userNode = usersNode.child(newUserId!)
            userNode.updateChildValues(["name": name, "email": email, "username": username])
            AppManager.currUser = Profile(auth.currentUser!)
            vc.performSegue(withIdentifier: "SignupVCtoNC", sender: vc)
        }
    }

}

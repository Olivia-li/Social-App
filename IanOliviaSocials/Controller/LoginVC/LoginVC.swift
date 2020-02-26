//
//  LoginVC.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/24/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        handleLogin()
    }
    
    func handleLogin() {
        let username = usernameTextfield.text!
        let password = passwordTextfield.text!
        
        let auth = Auth.auth()
        //Spec asked for login with username not email fix later
        auth.signIn(withEmail: username, password: password) { (user, error) in
            guard error == nil else {
                util.displayAlert(title: "Error", message: "login error", vc: self)
                return
            }
            guard user != nil else {
                util.displayAlert(title: "Error", message: "user field cannot be empty", vc: self)
                return
            }
            self.performSegue(withIdentifier: "LoginVCtoNC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: (Any).self)
        if let NC = segue.destination as? UINavigationController {
            NC.modalPresentationStyle = .fullScreen
        }
    }
}

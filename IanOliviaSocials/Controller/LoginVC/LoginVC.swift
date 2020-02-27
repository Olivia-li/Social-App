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

//TODO: Combine backend code with login signup code

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        AuthManager.handleLogin(usernameTextfield.text!, passwordTextfield.text!, self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: (Any).self)
        if let NC = segue.destination as? UINavigationController {
            NC.modalPresentationStyle = .fullScreen
        }
    }
    
    
    
}

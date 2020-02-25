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
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        handleLogin()
    }
    
    func handleLogin() {
        let username = usernameTextfield.text!
        let password = passwordTextfield.text!
        
        let auth = Auth.auth()
        auth.signIn(withEmail: username, password: password) { (user, error) in
            guard error == nil else {
                self.displayAlert(title: "Error", message: "login error")
                return
            }
            guard user != nil else {
                self.displayAlert(title: "Error", message: "user field cannot be empty")
                return
            }
            self.performSegue(withIdentifier: "toFeedVC", sender: self)
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: (Any).self)
        if let FeedVC = segue.destination as? FeedVC {
            FeedVC.modalPresentationStyle = .fullScreen
        }
    }
}

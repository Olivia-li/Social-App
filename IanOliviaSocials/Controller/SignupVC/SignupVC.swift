//
//  SignupVC.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-25.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import UIKit
import Firebase

class SignupVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func handleRegister() {
        let name = nameTextField.text!
        let username = usernameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let auth = Auth.auth()
        
        auth.createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                util.displayAlert(title: "Error", message: error.debugDescription, vc: self)
                return
            }
            guard user != nil else {
                util.displayAlert(title: "Error", message: "No user", vc: self)
                return
            }
            let db = Database.database().reference()
            let usersNode = db.child("Users")
            let newUserId = usersNode.childByAutoId().key
            let userNode = usersNode.child(newUserId!)
            userNode.updateChildValues(["name": name, "email": email, "username": username])
            self.performSegue(withIdentifier: "SignupVCtoNC", sender: self)
        }
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        handleRegister()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: (Any).self)
        if let NC = segue.destination as? UINavigationController {
            NC.modalPresentationStyle = .fullScreen
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

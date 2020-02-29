//
//  SignupVC.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-25.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import UIKit
import Firebase

//TODO: Combine backend code with login backend code

class SignupVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signupClicked(_ sender: Any) {
        AuthManager.handleRegister(nameTextField.text!, usernameTextField.text!, emailTextField.text!, passwordTextField.text!, self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: (Any).self)
        if let NC = segue.destination as? UINavigationController {
            NC.modalPresentationStyle = .fullScreen
        }
    }

}

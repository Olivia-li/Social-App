//
//  NewSocialVC.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/25/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//


import Foundation
import UIKit
import Firebase

class NewSocialVC: UIViewController {
    
    @IBOutlet weak var eventNameTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseImageClicked(_ sender: Any) {
    }
    
    @IBAction func createClicked(_ sender: Any) {
    }
}

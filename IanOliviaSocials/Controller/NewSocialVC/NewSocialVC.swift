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
    //Sorry I actually have no idea how to use a datepicker i just saw it and was like cool...can prob just look up field names tho
    
    var chosenImage: UIImage = UIImage(imageLiteralResourceName: "default-image")
    //Initialized with "default-image" in Assets.xcassets, replaced with chosen image after handleChooseImage is ran and image successfully chosen
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseImageClicked(_ sender: Any) {
        handleChooseImage()
    }
    
    @IBAction func createClicked(_ sender: Any) {
        
    }
    
}

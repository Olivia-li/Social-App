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
//        var name:String
//        var description:String
        if eventNameTextfield.text == ""{
            util.displayAlert(title: "Error", message: "Please put a name", vc: self)
            return
        }
        if descriptionTextfield.text == "" {
            util.displayAlert(title: "Error", message: "Please put a description", vc: self)
            return
        }
        guard let name = eventNameTextfield.text else {
            util.displayAlert(title: "Error", message: "Please put a name", vc: self)
            return
        }
        
        guard let description = descriptionTextfield.text else{
             util.displayAlert(title: "Error", message: "Please put a description", vc: self)
            return
        }
        
        let event = Event(name: name, id: "idk", description: description, host: AppManager.currUser)
        EventManager.eventList.append(event)
        _ = navigationController?.popViewController(animated: true)

        
    
        
        
//        let event = Event(name: eventNameTextfield.text!, id: "idk", description: descriptionTextfield.text!, host: AppManager.currUser)
        
    }
    
}

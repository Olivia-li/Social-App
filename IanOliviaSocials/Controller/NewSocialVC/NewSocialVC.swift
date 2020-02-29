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
    
    let eventRef = AppManager.db.child("Events")
    
    @IBOutlet weak var eventNameTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    
    private var datePicker: UIDatePicker?
    
    var chosenImage: UIImage = UIImage(imageLiteralResourceName: "default-image")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        
        dateTextfield.inputView = datePicker
    }
    
    @IBAction func chooseImageClicked(_ sender: Any) {
        handleChooseImage()
    }
    
    @IBAction func createClicked(_ sender: Any) {

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
        let eventId = eventRef.childByAutoId().key!
        let event = Event(name: name, id: eventId, description: description, host: AppManager.currUser.name)
        EventManager.eventList.append(event)
        event.storeInDatabase(name: name, id: eventId, description: description, host: AppManager.currUser.name, RSVP: 0)
        _ = navigationController?.popViewController(animated: true)

        
    
        
        
//        let event = Event(name: eventNameTextfield.text!, id: "idk", description: descriptionTextfield.text!, host: AppManager.currUser)
        
    }
    
}

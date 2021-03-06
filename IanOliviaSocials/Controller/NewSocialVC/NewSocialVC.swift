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
        datePicker?.addTarget(self, action: #selector(NewSocialVC.dateChanged(datePicker:)), for: .valueChanged)
        dateTextfield.inputView = datePicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NewSocialVC.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd | HH:mm"
        dateTextfield.text = dateFormatter.string(for: datePicker.date)
        //view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
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
        if dateTextfield.text == "" {
            util.displayAlert(title: "Error", message: "Please put a date", vc: self)
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
        guard let date = dateTextfield.text else{
            util.displayAlert(title: "Error", message: "Please put a date", vc: self)
            return
        }
//        if dateStr != "" {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MMM dd | HH:mm"
//            guard let date = dateFormatter.date(from: dateStr) else{
//                util.displayAlert(title: "Error", message: "Error transforming string to date object", vc: self)
//                return
//            }
//        } else{
//            util.displayAlert(title: "Error", message: "Please put a date", vc: self)
//        }
        
        let eventId = eventRef.childByAutoId().key!
        let event = Event(name: name, id: eventId, description: description, date: date, host: AppManager.currUser.name)
        EventManager.eventList.append(event)
        event.storeInDatabase(name: name, id: eventId, description: description, date: date, host: AppManager.currUser.name, RSVP: 0)
        _ = navigationController?.popViewController(animated: true)

        
    
        
        
//        let event = Event(name: eventNameTextfield.text!, id: "idk", description: descriptionTextfield.text!, host: AppManager.currUser)
        
    }
    
}

//
//  DetailVC.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/25/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class DetailVC: UIViewController {
            
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var interestNumLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var interestButton: UIButton!
    //TODO: Need to add date
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventNameLabel.text = EventManager.clickedEvent.name
        usernameLabel.text = "Host: \(EventManager.clickedEvent.host)"
        descriptionLabel.text = EventManager.clickedEvent.description
        interestNumLabel.text = "\(EventManager.clickedEvent.RSVP) people interested"
        //TODO: Need to add the image
        //TODO: Need to add the date
        
        if AppManager.currUser.interestList.contains(EventManager.clickedEvent){
            interestButton.setTitle("un-RSVP", for: .normal)
        }
        else{
            interestButton.setTitle("RSVP!", for: .normal)
        }
    }
    
    @IBAction func interestedClicked(_ sender: Any) {
        if AppManager.currUser.interestList.contains(EventManager.clickedEvent){
            AppManager.currUser.removeInterest(event: EventManager.clickedEvent)
            EventManager.clickedEvent.RSVP -= 1
            interestButton.setTitle("RSVP!", for: .normal)
        }
        else{
           AppManager.currUser.addInterest(event: EventManager.clickedEvent)
            EventManager.clickedEvent.RSVP += 1
            interestButton.setTitle("un-RSVP", for: .normal)
        }
        self.viewDidLoad()
        //Spec asks for this button to show up as being checked after clicked so user can select and deselect. Will come back to that.
        // I've added the logic for select and deselecting. Just need the UI
    }
    
}

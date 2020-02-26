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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Update outlets with the event provided when segued
    }
    
    @IBAction func interestedClicked(_ sender: Any) {
        //increment var for amount of interested users to this event
        
        //Spec asks for this button to show up as being checked after clicked so user can select and deselect. Will come back to that
    }
    
}

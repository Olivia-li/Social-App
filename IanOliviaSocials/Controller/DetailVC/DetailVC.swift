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
    }
    
    @IBAction func interestedClicked(_ sender: Any) {
    }
    
}

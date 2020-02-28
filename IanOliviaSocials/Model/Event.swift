//
//  Event.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-26.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class Event{
    var name: String
    var id: String
//    var picture: UIImage
    var description: String
//    var date: Date TODO: Figure out UIDatePicker
    var host: Profile
    var RSVP: Int
    
    init(name: String, id: String, description: String, host: Profile){
        self.name = name
        self.id = id
//        self.picture = picture
        self.description = description
//        self.date = date
        self.host = host
        self.RSVP = 0
    }
    
    func increaseRSVP(){
        self.RSVP += 1
    }
}

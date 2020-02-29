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

class Event: Equatable{
    
    let db = AppManager.db
    
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    
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
    
    func storeInDatabase(name:String, description: String, hostID: String){
        let usersNode = db.child("Events")
        let newUserId = usersNode.childByAutoId().key
        let userNode = usersNode.child(newUserId!)
        userNode.updateChildValues(["name": name, "description": description, "hostID": hostID, "RSVP": 0])
    }
    
    
    
}

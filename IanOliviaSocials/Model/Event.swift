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
    var host: String
    var RSVP: Int
    
    init(name: String, id: String, description: String, host: String){
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
    
    func storeInDatabase(name:String, id: String, description: String, host: String, RSVP: Int){
        let usersNode = db.child("Events")
        let newUserId = usersNode.childByAutoId().key
        let userNode = usersNode.child(newUserId!)
        userNode.updateChildValues(["name": name, "id": id,"description": description, "host": host, "RSVP": String(RSVP)])
    }
    
    
    
}

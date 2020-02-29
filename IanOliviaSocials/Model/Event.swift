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
    var date: String
    var host: String
    var RSVP: Int
    
    init(name: String, id: String, description: String, date: String, host: String){
        self.name = name
        self.id = id
//        self.picture = picture
        self.description = description
        self.date = date
        self.host = host
        self.RSVP = 0
    }
    
    func changeRSVP(positive: Bool){
        if positive{
            self.RSVP += 1
        }
        else{
            self.RSVP -= 1
        }
        let eventNode = db.child("Events").child(self.id)
                   eventNode.updateChildValues(["RSVP" : String(self.RSVP)])
    }
    
    func storeInDatabase(name:String, id: String, description: String, date: String,  host: String, RSVP: Int){
        let eventsNode = db.child("Events")
        let newEventId = eventsNode.childByAutoId().key
        let eventNode = eventsNode.child(newEventId!)
        eventNode.updateChildValues(["name": name, "id": id,"description": description, "date": date, "host": host, "RSVP": String(RSVP)])
    }
    
    
    
}

//
//  EventManager.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-26.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation

class EventManager{
    
    static var eventList: [Event] = []
    static var clickedEvent: Event!
        
    static func retrieveEvents(){
        print("Retrieve events")
        let ref = AppManager.db
        let userRef = ref.child("Events")
        print(userRef)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let usersDict = snapshot.value as? [String: [String: String]] else {
                print("Can't find events dictionary")
                return
            }
            for (eventId, _) in usersDict {
                guard let userInfoDict = usersDict[eventId] else {
                    print("Can't find event")
                    continue
                }
                print(userInfoDict["name"]!)
                let event = Event(name: userInfoDict["name"]!, id: eventId, description: userInfoDict["description"]!, host: userInfoDict["host"]!)
                eventList.append(event)
            }
        })
    }
}

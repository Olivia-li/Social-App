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
        let ref = AppManager.db
        let eventRef = ref.child("Events")
        eventRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let usersDict = snapshot.value as? [String: [String: String]] else {
                print("Can't find events dictionary")
                return
            }
            for (eventId, _) in usersDict {
                guard let userInfoDict = usersDict[eventId] else {
                    print("Can't find event")
                    continue
                }
                let event = Event(name: userInfoDict["name"]!, id: eventId, description: userInfoDict["description"]!, date: userInfoDict["date"]!, host: userInfoDict["host"]!)
                
                if !eventList.contains(event){
                    eventList.append(event)
                }
                print(eventList)
            }
        })
    }
}

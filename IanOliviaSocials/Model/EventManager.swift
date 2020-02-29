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
    
    var storedEvents: [Event] = []
    
//    func retrieveEvents() -> Event{
//        let ref = AppManager.db
//        let userRef = ref.child("Events")
//        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let usersDict = snapshot.value as? [String: [String: String]] else {
//                print("friends error")
//                return
//            }
//            for (eventId, _) in usersDict {
//                guard let userInfoDict = usersDict[eventId] else {
//                    print("friends error 2")
//                    continue
//                }
//                print(userInfoDict["name"]!)
//
//                let event = Event(name: userInfoDict["name"]!, id: <#T##String#>, description: userInfoDict["description"]!, host: <#T##Profile#>)
//                storedEvents.append()
//            }
//        })
//    }
}

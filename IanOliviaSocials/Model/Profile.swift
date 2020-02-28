//
//  File.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-26.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import Firebase

class Profile{
    var name: String
    var id: String
    var hostList: [Event] = []
    var interestList: [Event] = []
    
//    let userRef = AppManager.db.child("Users")

    init(_ user: User){
        self.id = user.uid
        self.name = "name"
    }

    
    
    func addEvent(event: Event){
        hostList.append(event)
    }
    
    func addInterest(event: Event){
        interestList.append(event)
    }
}

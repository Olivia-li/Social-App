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
    
    let userRef = AppManager.db.child("Users")

    init(_ user: User){
        self.id = user.uid
        self.name = "No Name"
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let userID = snapshot.value as? [String: [String: String]] else{
                print("error")
                return
            }
            guard let userName = userID[user.uid] else{
                print("Name Error")
                return
            }
            print(userName["name"]!)
            self.name = userName["name"]!
    }
        )}

    
    
    func addEvent(event: Event){
        hostList.append(event)
    }
    
    func addInterest(event: Event){
        interestList.append(event)
    }
    
    func removeInterest(event: Event){
        if let itemIndex = interestList.firstIndex(of: event){
            interestList.remove(at: itemIndex)
        }
        else{
            print("You dungoofed, there's no event >:( ")
        }
        
    }
}

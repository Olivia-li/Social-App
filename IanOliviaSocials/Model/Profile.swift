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

    init(_ userID: String){
        self.id = userID
        self.name = "No Name"
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let userref = snapshot.value as? [String: [String: String]] else{
                print("error")
                return
            }
            guard let userName = userref[userID] else{
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
    
    func removeEvent(event: Event){
        if let itemIndex = hostList.firstIndex(of: event){
            hostList.remove(at: itemIndex)
        }
        else{
            print("Can't remove hosted event")
        }
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

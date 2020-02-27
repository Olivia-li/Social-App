//
//  File.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-26.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation

class Profile{
    var name: String
    var hostList: [Event] = []
    var interestList: [Event] = []
    
    init(name:String){
        self.name = name
    }
}

//
//  Event.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-26.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit

class Event{
    var name: String
    var picture: UIImage
    var description: String
    var date: Date
    var host: String
    var RSVP: Int
    
    init(name: String, picture: UIImage, description: String, date: Date, host: String){
        self.name = name
        self.picture = picture
        self.description = description
        self.date = date
        self.host = host
        self.RSVP = 0
    }
}

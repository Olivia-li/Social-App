//
//  SignupManager.swift
//  IanOliviaSocials
//
//  Created by Olivia Li on 2020-02-25.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import Firebase

class AppManager{
    static var currUser: Profile!
    static let db = Database.database().reference()
    static let auth = Auth.auth()
}

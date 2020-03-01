//
//  UserDefaultsHelper.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/29/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: "isLoggedIn")
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: "isLoggedIn")
    }
}


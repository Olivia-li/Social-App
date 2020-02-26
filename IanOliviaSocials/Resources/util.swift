//
//  utilFuncs.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/26/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit

class util {
    static func displayAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        vc.present(alert, animated: true, completion: nil)
    }
}

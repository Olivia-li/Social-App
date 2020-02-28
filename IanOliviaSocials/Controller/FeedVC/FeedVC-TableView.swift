//
//  FeedVC-TableView.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/25/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventManager.eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        let event = EventManager.eventList[indexPath.row]
        
        cell.eventNameLabel.text = event.name
        cell.usernameLabel.text = event.host.name
        cell.interestNumLabel.text = "\(event.RSVP) people interested"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedEventId = indexPath.row
        print( indexPath.row)
        segueNum = 1
        self.performSegue(withIdentifier: "toDetailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
    
}

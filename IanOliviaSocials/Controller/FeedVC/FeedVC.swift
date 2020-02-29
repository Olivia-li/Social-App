//
//  FeedVC.swift
//  IanOliviaSocials
//
//  Created by Ian Shen on 2/24/20.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var segueNum: Int = 0  //0 for segue toNewSocialVC, 1 for toDetailVC
    var clickedEventId: Int = 0  //updated in didSelectRowAt
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        EventManager.retrieveEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try AppManager.auth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out", signOutError)
        }
        performSegue(withIdentifier: "unwindSegueToLogin", sender: self)
    }
    
    @IBAction func newEventClicked(_ sender: Any) {
        segueNum = 0
        self.performSegue(withIdentifier: "toNewSocialVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: (Any).self)
        switch segueNum {
        case 0:
            if let NewSocialVC = segue.destination as? NewSocialVC {
                NewSocialVC.modalPresentationStyle = .fullScreen
            }
            break
        case 1:
            if let detailVC = segue.destination as? DetailVC {
                detailVC.modalPresentationStyle = .fullScreen
                //send over clickedEventId or determin the event using clickedEventId and send that event to DetailVC
                //clickedEventId is the indexPath of the cell clicked and cells are supposed to be arranged in chronological order so we'll have to handle that indexing logic elsewhere
            }
            break
        default:
            print("segue error from FeedVC")
        }
    }
}

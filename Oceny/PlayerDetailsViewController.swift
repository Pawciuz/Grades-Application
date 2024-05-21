//
//  PlayerDetailsViewController.swift
//  Oceny
//
//  Created by Paweł on 21/05/2024.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    var player: Player?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "SavePlayerDetail",
           let playerName = nameTextField.text {
            player = Player(name: playerName, game: "Szachy", rating: 1)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
}

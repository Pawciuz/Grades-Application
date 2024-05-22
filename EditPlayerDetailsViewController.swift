//
//  EditPlayerDetailsViewController.swift
//  Oceny
//
//  Created by Paweł on 21/05/2024.
//

import UIKit

class EditPlayerDetailsViewController: UITableViewController {

    var game: String = "Szachy" {
        didSet {
            detailLabel.text = game
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",
                                                 for: indexPath) as! PlayerCell
        nameTextField=players[indexPath].name
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(player)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
}



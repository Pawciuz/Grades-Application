//
//  PlayersViewController.swift
//  Oceny
//
//  Created by Paweł on 14/05/2024.
//

import UIKit

class PlayersViewController: UITableViewController {

    // MARK: - Properties
    var players = SampleData.generatePlayersData()

}
extension PlayersViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    }
}

// MARK: - UITableViewDataSource
extension PlayersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",
                                                 for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]
        cell.player = player
        return cell
    }
}

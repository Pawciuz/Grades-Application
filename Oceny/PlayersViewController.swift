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
// MARK: - UITableViewDataSource
extension PlayersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        let player = players[indexPath.row]
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.game
        return cell
    }
}

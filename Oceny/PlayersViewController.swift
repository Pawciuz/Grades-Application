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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PlayersViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
              let player = playerDetailsViewController.player else {
            return
        }
        // add the new player to the players array
        players.append(player)
        
        // update the tableView
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    @IBAction func EditPlayerDetail(_ segue: UIStoryboardSegue) {
        guard let EditViewController = segue.source as? EditViewController,
              let player = EditViewController.player else {
            return
        }
        
        players[EditViewController.playerIndex!] = player
        // update the tableView
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension PlayersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]
        cell.player = player
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edytuj") { (action, view, completionHandler) in
            self.performSegue(withIdentifier: "showEditViewController", sender: indexPath)
            completionHandler(true)
        }
        editAction.backgroundColor = .blue
        
        let configuration = UISwipeActionsConfiguration(actions: [editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditViewController" {
            if let navigationController = segue.destination as? UINavigationController {
                if let editViewController = navigationController.topViewController as? EditViewController {
                    if let indexPath = sender as? IndexPath {
                        editViewController.player = players[indexPath.row]
                        editViewController.playerIndex = indexPath.row
                    }
                }
            }
        }
    }

     
}

//
//  GamePickerViewController.swift
//  Oceny
//
//  Created by Paweł on 21/05/2024.
//

import UIKit

class GamePickerViewController: UITableViewController {

    var games = [
        "Angry Birds",
        "Szachy",
        "Rosyjska Ruletka",
        "Warcaby",
        "Poker",
        "Kółko i Krzyżyk",
        "Hill Climb Racing",
        "Pou"
    ]
}
extension GamePickerViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
}


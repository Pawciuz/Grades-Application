//
//  GamePickerViewController.swift
//  Oceny
//
//  Created by Paweł on 21/05/2024.
//

import UIKit

class GamePickerViewController: UITableViewController {

    // MARK: - Properties
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SaveSelectedGame",
              let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let index = indexPath.row
        selectedGame = games[index]
    }
    var selectedGame: String? {
        didSet {
            if let selectedGame = selectedGame,
               let index = games.index(of: selectedGame) {
                selectedGameIndex = index
            }
        }
    }
    
    
    var selectedGameIndex: Int?
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
        
        if indexPath.row == selectedGameIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}
extension GamePickerViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Inny wiersz jest wybrany – należy go odznaczyć
        if let index = selectedGameIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedGame = games[indexPath.row]
        
        // aktualizacja zaznaczenia dla obecnego wiersza
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
}


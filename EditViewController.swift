//
//  EditViewController.swift
//  Oceny
//
//  Created by Paweł on 22/05/2024.
//

import UIKit

class EditViewController: UITableViewController {
    var player: Player?
    var playerIndex: Int?
    
    
    var game: String? {
        didSet {
            detailLabel.text = game
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = player?.name
        detailLabel.text = player?.game
        if((player?.game) != nil){
            game = player?.game
        }
    }

   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditPlayerDetail",
           let playerName = nameTextField.text {
            player = Player(name: playerName, game: game, rating: 1);
        }
        if segue.identifier == "PickGame",
           let gamePickerViewController = segue.destination as? GamePickerViewController {
            gamePickerViewController.selectedGame = game
        }
    }
}
// MARK: - IBActions
extension EditViewController {
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamePickerViewController,
           let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
}
// MARK: - UITableViewDelegate
extension EditViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}

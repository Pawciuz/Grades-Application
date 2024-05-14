//
//  SampleData.swift
//  Oceny
//
//  Created by Paweł on 14/05/2024.
//

import Foundation

final class SampleData {
    static func generatePlayersData() -> [Player]{
        return [
            Player(name:"Jan Kowalski", game: "Kółko i krzyżyk", rating: 4),
            Player(name:"Joanna Mak", game: "Statki", rating: 5),
            Player(name:"Grzegorz Bóbr", game: "Poker", rating: 2),
            Player(name:"Grzegorz Lotek", game: "Tetris", rating: 3),
            Player(name:"Kuba Klocek", game: "Klocki", rating: 2),
            Player(name:"Julia Kotek", game: "Klocki", rating: 3)
        ]
    }
}

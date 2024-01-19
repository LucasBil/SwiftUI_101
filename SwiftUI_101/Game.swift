//
//  Game.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrim"),
    Game(name: "WoW", genre: .mmorpg, coverName: "warcraft"),
    Game(name: "CS:GO", genre: .fps, coverName: "cs_go"),
    Game(name: "Diablo IV", genre: .looter, coverName: "diabloIV")
]

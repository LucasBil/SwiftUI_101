//
//  LootItem.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

struct LootItem: Identifiable {
    var id: UUID
    var quantity : Int = 1
    var name : String
    var type : ItemType
    var rarity : Rarity
    var attackStrength : Int?
    var game : Game
    
    static let emptyLootItem = LootItem(id: UUID(), name: "Arc Antique", type: ItemType.bow, rarity: Rarity.rare, game: Game.emptyGame)
}

enum ItemType : String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknowned = "🎲"
}

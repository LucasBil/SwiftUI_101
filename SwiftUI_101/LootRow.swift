//
//  LootRow.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

struct LootRow: View {
    var lootItem : LootItem
    
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .fill(lootItem.rarity.color)
                    .frame(width: 12, height: 12)
                Text(lootItem.name)
                Spacer()
                Text("\(lootItem.type.rawValue) x\(lootItem.quantity)")
            }
        }
    }
}

//
//  LootView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/26/24.
//

import SwiftUI
import Charts

class Inventory : ObservableObject {
    @Published var loot = [
        LootItem(id: UUID(), name: "Épée de l'Aube", type: .dagger, rarity: .epic, attackStrength: 35, game: availableGames[0]),
            LootItem(id: UUID(), name: "Bouclier d'Émeraude", type: .shield, rarity: .rare, attackStrength: nil, game: availableGames[2]),
            LootItem(id: UUID(), name: "Armure Légendaire", type: .unknowned, rarity: .legendary, attackStrength: nil, game: availableGames[4]),
            LootItem(id: UUID(), name: "Arc du Vent Sylvestre", type: .bow, rarity: .rare, attackStrength: 25, game: availableGames[1]),
            LootItem(id: UUID(), name: "Anneau des Abysses", type: .ring, rarity: .epic, attackStrength: nil, game: availableGames[3]),
            LootItem(id: UUID(), name: "Dague des Ombres", type: .dagger, rarity: .common, attackStrength: 18, game: availableGames[0]),
            LootItem(id: UUID(), name: "Lance de Givre", type: .ice, rarity: .rare, attackStrength: 30, game: availableGames[1]),
            LootItem(id: UUID(), name: "Casque de Feu Follet", type: .unknowned, rarity: .epic, attackStrength: nil, game: availableGames[2]),
            LootItem(id: UUID(), name: "Gantelets du Tonnerre", type: .unknowned, rarity: .legendary, attackStrength: nil, game: availableGames[3]),
            LootItem(id: UUID(), name: "Cape de l'Ombre Noire", type: .unknowned, rarity: .common, attackStrength: nil, game: availableGames[4]),
            LootItem(
                id: UUID(),
                name: "Épée Excalibur",
                type: .dagger,
                rarity: .unique,
                attackStrength: 50,
                game: availableGames[0])
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct LootView: View {
    @StateObject var inventory : Inventory = Inventory()
    @State var showAddItemView : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Section{
                    List {
                        ForEach(inventory.loot, id: \.self.id) { item in
                            NavigationLink {
                                LootDetailView(item: item)
                            } label: {
                                LootRow(lootItem: item)
                            }
                        }
                    }
                    .sheet(isPresented: $showAddItemView, content: {
                        AddItemView()
                            .environmentObject(inventory)
                    })
                    .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                    .toolbar(content: { // La barre d'outil de notre page
                        ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                            Button(action: {
                                showAddItemView.toggle() // L'action de notre bouton
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                            })
                        }
                    })
                }
                Section{
                    List([1], id: \.self){ _ in
                        Section(header: Text("Statistique")){
                            Chart(inventory.loot) { item in
                                if(item.attackStrength != nil){
                                    BarMark(
                                        x: .value("Name", item.name),
                                        y: .value("Occurence",item.attackStrength!)
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LootView()
}

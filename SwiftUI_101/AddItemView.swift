//
//  AddItemView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

enum Rarity : String, CaseIterable {
    case common = "common"
    case uncommon = "uncommon"
    case rare = "rare"
    case epic = "epic"
    case legendary = "legendary"
    case unique = "unique"
    
    var color : Color{
        switch self {
            case .common:
                return .gray // Gris clair
            case .uncommon:
                return .green // Vert
            case .rare:
                return .blue // Bleu
            case .epic:
                return .purple // Violet
            case .legendary:
                return .yellow // Or
            case .unique:
                return .red // Rouge clair
        }
    }
}

struct AddItemView: View {
    @State var name : String = ""
    @State var rarity : Rarity = Rarity.common
    @State var game : Game = Game.emptyGame
    @State var quantity : Int = 0
    @State var itemType : ItemType = ItemType.unknowned
    @State var dommage : Int = 0
    
    @State var damageable : Bool = false
    @State var formIsValid : LootItem?
    @State var invalidField : String?
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form { // Wrapper de notre formulaire
                Section { // Correspond à une section du formulaire
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rarete", selection: $rarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(String(describing: rarity).capitalized)
                        }
                    }
                }
                
                Section { // Correspond à une section du formulaire
                    Picker("Jeu", selection: $game) {
                        Text("Non spécifié").tag(Game.emptyGame)
                        ForEach(availableGames, id: \.self) { game in
                            Text(String(describing: game.name).capitalized)
                        }
                    }
                    Stepper("Combien : \(quantity)",
                            value: $quantity,
                            in : 0...50,
                            step: 1
                    )
                }
                
                Section { // Correspond à une section du formulaire
                    HStack{
                        Text("Type")
                        Spacer()
                        Text("\(itemType.rawValue)")
                    }
                    Picker("Type", selection: $itemType) {
                        ForEach(ItemType.allCases, id: \.self) { itemtype in
                            Text(itemtype.rawValue)
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                
                Section { // Correspond à une section du formulaire
                    Toggle(isOn: $damageable.animation()){
                        Text("Item d'attaque ?")
                    }
                    if damageable {
                        Stepper("Combien : \(dommage)",
                                value: $dommage,
                                in : 0...50,
                                step: 1
                        )
                    }
                }
                
                Section { // Correspond à une section du formulaire
                    Button(action: {
                        let loot = LootItem(id: UUID(), quantity: quantity, name: name, type: itemType, rarity: rarity, attackStrength: dommage, game: game)
                        
                        if(name.count < 2 || name.isEmpty){
                            invalidField = "name"
                            formIsValid = loot
                            return
                        }
                        if(itemType ==  ItemType.unknowned){
                            invalidField = "type"
                            formIsValid = loot
                            return
                        }
                        if(game == Game.emptyGame){
                            invalidField = "game"
                            formIsValid = loot
                            return
                        }
                        inventory.addItem(item:loot)
                        dismiss()
                    },
                        label: {
                        Text("Ajouter l'objet")
                    })
                }
            }
            .navigationBarTitle("Ajouter un loot")
            .alert(item: $formIsValid) { _ in
                        Alert(title: Text("Form is invalid"),
                              message: Text("Le champs " + invalidField! + " est invalid"),
                              dismissButton: .default(Text("Dismiss"))
                        )
                    }
        }
    }
}

#Preview {
    AddItemView()
}

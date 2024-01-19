//
//  AddItemView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

enum Rarity : CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
}

struct AddItemView: View {
    @State var name : String = ""
    @State var rarity : Rarity = Rarity.common
    @EnvironmentObject var inventory: Inventory
    
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
                Button(action: {
                    inventory.addItem(item: $name.wrappedValue)
                },
                    label: {
                    Text("Ajouter")
                })
            }
        }
    }
}

#Preview {
    AddItemView()
}

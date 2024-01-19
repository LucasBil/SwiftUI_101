//
//  LootDetailView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item : LootItem
    
    var body: some View {
        Section{
            VStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(item.rarity.color.gradient)
                    .frame(width: 150, height: 150)
                    .shadow(color: item.rarity.color, radius: 50, x: 0, y: 5)
                    .overlay(
                        Text("\(item.type.rawValue)")
                            .font(.system(size: 75))
                    )
                Spacer()
                    .frame(width: 0, height: 30)
                Text("\(item.name)")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(item.rarity.color)
            }
            if item.rarity == Rarity.unique{
                RoundedRectangle(cornerRadius: 10)
                    .fill(item.rarity.color.gradient)
                    .frame(width: 350, height: 50)
                    .overlay(
                        Text("Item Unique 🏆")
                            .bold()
                            .foregroundColor(Color.white)
                    )
            }
        }
        Section{
            List([1], id: \.self) { _ in
                Section(header: Text("Informations")){
                    HStack{
                        if let image = item.game.coverName {
                            Image("\(image)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 58)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                        else {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.gray, .gray.opacity(0.4)]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                                .overlay{
                                    Image(systemName: "rectangle.slash")
                                        .foregroundColor(.black)
                                        .opacity(0.4)
                                        .padding(1)
                                }
                                .frame(width: 58, height: 80)
                        }
                        
                        Text(item.game.name)
                    }
                    Text("Your single item goes here")
                    Text("In-game : \(item.name)")
                    if item.attackStrength != nil {
                        Text("Puissance (ATQ) : \(item.attackStrength!)")
                    }
                    Text("Possédé(s) : \(item.quantity)")
                    Text("Rareté : \(item.rarity.rawValue.capitalized)")
                }
            }
            
        }
    }
}

#Preview {
    LootDetailView(item: LootItem.emptyLootItem)
}

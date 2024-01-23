//
//  LootDetailView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item : LootItem
    @State private var isAppeared : Bool = false
    @State private var iscliked : Bool = false
    
    var body: some View {
        Section{
            VStack{
                ZStack{
                    LootRectangle(item: item, text: "\(item.type.rawValue)", fontWeight: 75, borderRadius: 25)
                        .frame(width: 150, height: 150)
                        .task {
                            do{
                                try await Task.sleep(nanoseconds: 400000000) // 0.4s
                                isAppeared.toggle()
                            }catch{
                                print("Error")
                            }
                        }
                        .animation(.spring){
                            $0.rotation3DEffect(
                                .degrees(isAppeared ? 360 : 0),
                                axis: (x: 1, y: 0.5, z: 0.0)
                            )
                        }
                        .animation(.bouncy.speed(0.25).delay(0.4)){
                            $0.shadow(color: item.rarity.color, radius: isAppeared ? 100 : 0, x: 0, y: 5)
                        }
                        .onTapGesture {
                            iscliked.toggle()
                        }
                    
                    StarView(size: 40)
                        .scaleEffect(iscliked ? 1 : 0)
                        .animation(.spring(duration: 1,bounce: 0.5)){
                            $0.shadow(color: Color.yellow, radius: 10)
                        }
                        .animation(.spring(), value: iscliked)
                        .offset(CGSize(width: 70, height: -70))
                        .animation(.none, value: iscliked)
                }
                Spacer()
                    .frame(width: 0, height: 30)
                Text("\(item.name)")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(item.rarity.color)
            }
            if item.rarity == Rarity.unique{
                LootRectangle(item: item, text: "Item Unique 🏆")
                    .frame(width: 350, height: 50)
                    .animation(.easeInOut.repeatForever().speed(0.40)){
                        $0.shadow(color: item.rarity.color, radius: isAppeared ? 7 : 3, x: 0, y: 0)
                    }
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

struct StarView: View {
    let size : Int
    
    var body: some View {
        ZStack {
            Path { path in
                let numberOfPoints = 4
                let center = CGPoint(x: size/2, y: size/2)
                let radius: CGFloat = CGFloat(size/2)
                let angleIncrement = .pi * 2 / CGFloat(numberOfPoints * 2)

                for i in 0..<numberOfPoints * 2 {
                    let angle = CGFloat(i) * angleIncrement - .pi / 2
                    let distance = i.isMultiple(of: 2) ? radius : radius / 2
                    let point = CGPoint(x: center.x + cos(angle) * distance, y: center.y + sin(angle) * distance)
                    
                    if i == 0 {
                        path.move(to: point)
                    } else {
                        path.addLine(to: point)
                    }
                }
                path.closeSubpath()
            }
            .fill(Color.yellow)
        }
        .frame(width: CGFloat(size), height: CGFloat(size))
    }
}

struct LootRectangle: View {
    let item : LootItem
    let text : String
    let fontWeight : Int?
    let borderRadius : Int
    
    init(item: LootItem, text: String, fontWeight: Int? = nil, borderRadius: Int = 10) {
            self.item = item
            self.text = text
            self.fontWeight = fontWeight
            self.borderRadius = borderRadius
        }
    
    var body: some View {
        if let _fontWeight = fontWeight {
            RoundedRectangle(cornerRadius: CGFloat(borderRadius))
                .fill(item.rarity.color.gradient)
                .overlay(
                    Text(text)
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.system(size: CGFloat(_fontWeight)))
                )
        }
        else{
            RoundedRectangle(cornerRadius: CGFloat(borderRadius))
                .fill(item.rarity.color.gradient)
                .overlay(
                    Text(text)
                        .bold()
                        .foregroundColor(Color.white)
                )
        }
    }
}

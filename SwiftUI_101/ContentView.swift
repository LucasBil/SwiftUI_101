//
//  ContentView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI
import Charts

enum LooterFeature {
    case Loot
    case WishList
    case Profile
}

struct ContentView: View {
    @State var page : LooterFeature = .Loot
    
    var body: some View {
        TabView(selection: $page) {
                    LootView()
                        .tabItem {
                            Label("Loot", systemImage: "bag.fill")
                        }
                        .tag(LooterFeature.Loot)
                    WishListView()
                        .tabItem {
                            Label("Wishlist", systemImage: "heart.fill")
                        }
                        .tag(LooterFeature.WishList)
                    ProfileView()
                        .tabItem {
                            Label("Profil", systemImage: "person.fill")
                        }
                        .tag(LooterFeature.Profile)
                }
    }
}

#Preview {
    ContentView()
}

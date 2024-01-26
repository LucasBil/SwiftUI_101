//
//  SwiftUI_101App.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/19/24.
//

import SwiftUI

@main
struct SwiftUI_101App: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView()
            } else {
                OnboardingView()
            }
        }
    }
}

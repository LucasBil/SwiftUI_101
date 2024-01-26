//
//  OnboardingView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/26/24.
//

import SwiftUI

enum WidgetPageView : CaseIterable {
    case HOME
    case WISHLIST
    
    func widgetPage(widgetSelected : Binding<WidgetPageView>) -> OnboardingPageView {
        switch self {
            case .HOME :
                return OnboardingPageView(
                    idWidget : widgetSelected,
                    title: "Avoir un widget sur l'écran d'accueil",
                    description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'acceuil de votre appareil",
                    image: nil
                )
            case .WISHLIST:
                return OnboardingPageView(
                    idWidget : widgetSelected,
                    title: "Votre wishlist",
                    description: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir",
                    image: "wand.and.stars"
                )
        }
    }
}

struct OnboardingView: View {
    var body: some View {
        
        @State var widgetSelected : WidgetPageView = .HOME
        
        TabView(selection: $widgetSelected,
                content:  {
            ForEach(WidgetPageView.allCases, id: \.self){ widget in
                VStack{
                    widget.widgetPage(widgetSelected: $widgetSelected)
                }.tabItem { Text("Tab Label") }
                    .tag(WidgetPageView.allCases.firstIndex(of: widget))
            }
        })
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}

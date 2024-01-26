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
    case OVERVIEW
}

struct OnboardingView: View {
    
    @State var widgetSelected :WidgetPageView = .HOME
    
    let widgets = [
        OnboardingPageDataSource(
            widgetType: .HOME,
            title: "Gérer ses loots",
            description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle",
            image: "gym.bag.fill"
        ),
        OnboardingPageDataSource(
            widgetType: .WISHLIST,
            title: "Votre wishlist",
            description: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir",
            image: "wand.and.stars"
        ),
        OnboardingPageDataSource(
            widgetType: .OVERVIEW,
            title: "En un coup d'oeuil",
            description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil.",
            image: "iphone.case"
        )
    ]
    
    var body: some View {
        TabView(selection: $widgetSelected,
                content:  {
            ForEach(widgets, id: \.widgetType){ widget in
                VStack{
                    OnboardingPageView(
                        selectedWidget : $widgetSelected,
                        dataSource: widget
                    )
                }.tabItem { }
                    .tag(widget.widgetType)
            }
        })
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}

#Preview {
    OnboardingView()
        .preferredColorScheme(.dark)
        .previewDisplayName("Dark Mode")
}

//
//  OnboardingPageView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/26/24.
//

import SwiftUI

struct OnboardingPageDataSource {
    let widgetType : WidgetPageView
    let title : String
    let description : String
    let image : String?
}

struct OnboardingPageView: View {
    @Binding var selectedWidget : WidgetPageView
    let dataSource : OnboardingPageDataSource
    
    var body: some View {
        Spacer()
        
        Text(dataSource.title)
            .fontWeight(.bold)
            .fontWidth(.standard)
            .font(.system(size: 60))
            .multilineTextAlignment(.center)
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
        
        ZStack{
            Circle()
                .fill(Color.red.gradient)
                .frame(width: 200)
            if let icon = dataSource.image {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(.white)
            }
        }
        
        Spacer()
        
        Text(dataSource.description)
            .fontWidth(.expanded)
            .multilineTextAlignment(.center)
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
        
        Spacer()
        
        Button(action: {
            switch dataSource.widgetType {
                case .HOME:
                    selectedWidget = .WISHLIST
                case .WISHLIST:
                    selectedWidget = .OVERVIEW
                case .OVERVIEW:
                    UserDefaults.standard.set(true, forKey: "isOnboardingDone")
            }
        }, label: {
            Spacer()
                .frame(width: 15)
            Text(dataSource.widgetType != WidgetPageView.WISHLIST ? "Continuer" : "Commencer")
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
                .frame(width: 15)
        })
        .padding(10)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        
        Spacer()
    }
}

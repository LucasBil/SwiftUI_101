//
//  OnboardingPageView.swift
//  SwiftUI_101
//
//  Created by Lucas BILLY on 1/26/24.
//

import SwiftUI

struct OnboardingPageView: View {
    @Binding var idWidget : WidgetPageView
    let title : String
    let description : String
    let image : String?
    
    var body: some View {
        Spacer()
        
        Text(title)
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
                .frame(width: 100)
            if let icon = image {
                Image(systemName: icon)
                    .colorInvert()
            }
        }
        
        Spacer()
        
        Text(description)
            .fontWidth(.expanded)
            .multilineTextAlignment(.center)
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
        
        Spacer()
        
        Button(action: { idWidget = .WISHLIST }, label: {
            Spacer()
                .frame(width: 15)
            Text("Suivant")
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

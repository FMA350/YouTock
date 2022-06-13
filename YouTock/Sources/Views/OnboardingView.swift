//
//  EntryWithSlider.swift
//  YouTock
//
//  Created by Francesco Maria Moneta on 6/9/22.
//

import SwiftUI

extension View
{
    func ApplyTikTokShadow() -> some View
    {
        self
            .shadow(color: Color("TickTokPink"), radius: 20, x: 10, y: 20)
            .shadow(color: Color("TikTokAqua"), radius: 20, x: -10, y: -20)
    }
}

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnContentView: Bool = false
    
    var body: some View {
        VStack
        {
            //MARK: HEADER, title
            
            HStack {
                Text("YouTok")
                    .font(.system(.title, design: .monospaced))
                    .foregroundColor(Color("YouTubeRed"))
                    .fontWeight(.semibold)
                .padding()
            }//: HStack
                
            //MARK: CENTER, logo
            Image("youtube-logo")
                .ApplyTikTokShadow()
            //MARK: FOOTER, button
            SliderButtonComponent(ShapeColor: Color("TikTokPink"), sliderCompletes: {
                isOnContentView = true;
            })
            
        }//: VSTACK
    }
}

struct EntryWithSlider_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

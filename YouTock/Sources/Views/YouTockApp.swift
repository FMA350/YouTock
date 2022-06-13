//
//  YouTockApp.swift
//  YouTock
//
//  Created by Francesco Maria Moneta on 6/9/22.
//

import SwiftUI

@main
struct YouTockApp: App {
    @AppStorage("onboarding") var isOnContentView: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ZStack
            {
                if(isOnContentView)
                {
                    ContentView()
                }
                else
                {
                    OnboardingView()
                }
            }
        }
    }
}

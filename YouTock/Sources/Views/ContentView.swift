//
//  ContentView.swift
//  YouTock
//
//  Created by Francesco Maria Moneta on 6/9/22.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() ->  some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 128)
            .foregroundColor(.pink)
            .opacity(0.5)
    }
}



struct ContentView: View {
    
    var body: some View {

        TabView {
                //TAB 1
                VideoTab()
                    .tabItem {
                        Label("TV Shows", systemImage:"house.fill")
                }
                HelpTab()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                }
                Text("Nearby Screen")
                    .tabItem {
                    Label("Locations", systemImage: "mappin.circle.fill")
                }
        } //: TABVIEW
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  MainTabsView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//


import SwiftUI

struct MainTabsView: View {
    @State private var selectedIndex = 0
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "primaryBlue")
        UITabBar.appearance().backgroundColor = UIColor(named: "primaryBlue")
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }
    
    var body: some View {
        VStack {
            Header()
            TabView(selection: $selectedIndex) {
                VStack{
                    Homepage()
                        .navigationBarTitle("You can't see me 👀")
                        .navigationBarHidden(true)
                    }
                    .onTapGesture{self.selectedIndex = 0}
                    .tabItem{Image(systemName: "house")}
                    .tag(0)
                
                Saved()
                    .navigationBarTitle("You can't see me 👀")
                    .navigationBarHidden(true)
                    .onTapGesture{self.selectedIndex = 1}
                    .tabItem{Image(systemName: "heart")}
                    .tag(1)
                
                Lines()
                    .navigationBarTitle("You can't see me 👀")
                    .navigationBarHidden(true)
                    .onTapGesture{self.selectedIndex = 2}
                    .tabItem{Image(systemName: "figure.stand.line.dotted.figure.stand")}
                    .tag(2)
                
                Profile()
                    .navigationBarTitle("You can't see me 👀")
                    .navigationBarHidden(true)
                    .onTapGesture{self.selectedIndex = 3}
                    .tabItem{Image(systemName: "person")}
                    .tag(3)
            }
                .accentColor(Color("primary"))
                .navigationBarTitle("You can't see me 👀")
            .navigationBarHidden(true)
        }
    }
}

struct MainTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabsView()
    }
}



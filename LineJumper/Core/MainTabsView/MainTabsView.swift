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
        UITabBar.appearance().barTintColor = UIColor(named: "primaryBlue")
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            VStack{
                Header()
                Homepage()
                }
                .onTapGesture{self.selectedIndex = 0}
                .tabItem{Image(systemName: "house")}
                .tag(0)
            
            Saved()
                .onTapGesture{self.selectedIndex = 1}
                .tabItem{Image(systemName: "heart")}
                .tag(1)
            
            Lines()
                .onTapGesture{self.selectedIndex = 2}
                .tabItem{Image(systemName: "figure.stand.line.dotted.figure.stand")}
                .tag(2)
            
            Profile()
                .onTapGesture{self.selectedIndex = 3}
                .tabItem{Image(systemName: "person")}
                .tag(3)
        }.accentColor(Color("primary"))
    }
}

struct MainTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabsView()
    }
}


struct Header: View {
    var body: some View {
        HStack{
            Button {
                print("open sidebar")
            } label: {
                Image(systemName: "line.3.horizontal")
                    .padding(12)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("secondaryBlue").opacity(0.05), lineWidth: 1))
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
            }
            Spacer()
            
            Text("67 Skyvalley Dr.")
                .foregroundColor(Color("primary"))
            
            Spacer()
            Button {
                print("clicking on img")
            } label: {
                Image("profilePic")
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius:20))
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
            }
        }.padding(.horizontal)
    }
}

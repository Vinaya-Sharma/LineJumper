//
//  EmployeeTabsView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//


import SwiftUI

struct EmployeeTabsView: View {
    @State private var selectedIndex = 0
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "primaryBlue")
        UITabBar.appearance().backgroundColor = UIColor(named: "primaryBlue")
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                VStack{
                    BusinessInformation()
                        .navigationBarTitle("You can't see me 👀")
                        .navigationBarHidden(true)
                    }
                    .onTapGesture{self.selectedIndex = 0}
                    .tabItem{Image(systemName: "house")}
                    .tag(0)
                
                Services()
                    .navigationBarTitle("You can't see me 👀")
                    .navigationBarHidden(true)
                    .onTapGesture{self.selectedIndex = 1}
                    .tabItem{Image(systemName: "gear")}
                    .tag(1)
                
                ManageCustomers()
                    .navigationBarTitle("You can't see me 👀")
                    .navigationBarHidden(true)
                    .onTapGesture{self.selectedIndex = 2}
                    .tabItem{Image(systemName: "figure.stand.line.dotted.figure.stand")}
                    .tag(2)
                
                Profile()
                    .navigationBarTitle("You can't see me 👀")
                    .navigationBarHidden(true)
                    .onTapGesture{self.selectedIndex = 3}
                    .tabItem{Image(systemName: "phone")}
                    .tag(3)
            }
                .accentColor(Color("primary"))
                .navigationBarTitle("You can't see me 👀")
            .navigationBarHidden(true)
        }
    }
}

struct EmployeeTabsView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeTabsView()
    }
}



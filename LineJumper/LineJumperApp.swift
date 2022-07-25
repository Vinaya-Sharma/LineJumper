//
//  LineJumperApp.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import SwiftUI

@main
struct LineJumperApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabsView()
                .navigationBarTitle("You can't see me 👀")
                .navigationBarHidden(true)
            }
        }
    }
}

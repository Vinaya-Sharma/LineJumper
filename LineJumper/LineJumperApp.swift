//
//  LineJumperApp.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import SwiftUI
import Firebase

@main
struct LineJumperApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                .navigationBarTitle("You can't see me 👀")
                .navigationBarHidden(true)
            }.environmentObject(viewModel)
                .navigationViewStyle(.stack)
        }
    }
}

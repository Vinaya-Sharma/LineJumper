//
//  ContentView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
      
        VStack{
            if viewModel.userSession == nil {
                LoginView()
            } else {
                VStack{
                    Header()
                    MainTabsView()
                  
                  }
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}

//
//  SideMenuView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {

        VStack(alignment: .leading){
            VStack(alignment:.leading, spacing: 4)
                {
                    Circle()
                        .frame(width: 48, height: 48)
                    Text("Krish Sharma")
                        .font(.headline)
                    Text("@KrishSharmaa")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                  //  UsersStatsView()
                }.padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){
                item in
                if item == .profile{
                    NavigationLink{
                //        ProfileView()
                    } label: {
                        SideMenuRowView(item: item).foregroundColor(.black)
                    }
                } else if item == .logout{
                    Button{
                            print("Handle logout heree...")
                    }label: {
                        SideMenuRowView(item: item)
                    }
                } else {
                    SideMenuRowView(item: item)
                }
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

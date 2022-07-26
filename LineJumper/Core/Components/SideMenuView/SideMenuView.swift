//
//  SideMenuView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {

        VStack(alignment: .leading){
            VStack(alignment:.leading, spacing: 4)
                {
                    Image("profilePic")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(100)
                        .padding(.bottom, 8)
                    
                    Text("Krish Sharma")
                        .font(.headline)
                    Text("Ninas Parlor")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                  //  UsersStatsView()
                }.padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){
                item in
                if item == .profile{
                    NavigationLink{
                        Profile()
                    } label: {
                        SideMenuRowView(item: item).foregroundColor(.black)
                    }
                } else if item == .logout{
                    Button{
                        viewModel.signOut()
                    }label: {
                        SideMenuRowView(item: item)
                            .foregroundColor(.black)
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

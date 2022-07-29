//
//  Header.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI
import Kingfisher

struct Header: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let currentUser = viewModel.currentUser{
            HStack{
                Button {
                    viewModel.signOut()
                } label: {
                    Image(systemName: "arrow.left")
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
                    if currentUser.photo != nil {
                        KFImage(URL(string: currentUser.photo! )).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius:20))
                            .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
                    } else {
                        Image("flying")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius:20))
                            .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

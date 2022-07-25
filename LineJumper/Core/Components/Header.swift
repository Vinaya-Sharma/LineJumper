//
//  Header.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

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

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

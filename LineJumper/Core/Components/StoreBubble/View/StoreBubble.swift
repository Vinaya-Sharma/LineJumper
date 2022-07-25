//
//  StoreBubble.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI

struct StoreBubble: View {
    var body: some View {
        VStack(alignment:.leading){
            Image("salon_4")
                .frame(width: 280, height: 180)
                .cornerRadius(25)
                .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
            
            VStack(alignment:.leading, spacing: 4){
                Text("hiii").foregroundColor(.clear);

                
                Text("Ninas Parlor")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                HStack{
                    Text("salon")
                        .font(.footnote)
                    
                    Spacer()
                    
                    Text("69 Gore Rd.")
                        .font(.footnote)
                }.foregroundColor(Color("primary"))
                 
            }
            .padding(10)
            .frame(width: 280, height: 50)
                .background(.white)
                .offset(y:-40)
            
            
        }.frame(width: 280)
            .overlay(
                  RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("secondaryBlue").opacity(0.1), lineWidth: 2)
            )
            .padding(.horizontal)
}
}

struct StoreBubble_Previews: PreviewProvider {
    static var previews: some View {
        StoreBubble()
    }
}

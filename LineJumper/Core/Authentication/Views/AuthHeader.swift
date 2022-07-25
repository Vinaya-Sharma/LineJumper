//
//  AuthHeader.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct AuthHeader: View {
    let title: String
    let description: String
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                HStack{Spacer()}
                Text(title).fontWeight(.semibold)
                Text(description).fontWeight(.semibold)
            }.padding(.leading)
                .font(.largeTitle)
                .frame(height: 260)
                .background(Color("primary"))
                .foregroundColor(.white)
                .clipShape(RoundedShape(corner: [.bottomRight]))
        }
        
    }
}

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader(title: "Hello", description: "Welcome back")
    }
}

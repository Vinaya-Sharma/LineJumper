//
//  Saved.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI

struct Saved: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Your Favourites")
                .font(.title2)
                .bold()
                .foregroundColor(Color("primaryBlue"))
                .padding(.vertical)
            
            Text("seamlessly stand in line at various locations by saving your favourites")
                .font(.caption)
                .frame(width: 250)
            
            Text("currently empty")
                .font(.caption)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .background(Color("primary"))
                .foregroundColor(.white)
                .cornerRadius(100)
    
            
            Image("bunnyHeart")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            Spacer()
            
        }.padding()
    }
}

struct Saved_Previews: PreviewProvider {
    static var previews: some View {
        Saved()
    }
}

//
//  SearchBar.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let placeholder: String
    
    
    var body: some View {

        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("secondaryBlue"))
            TextField(placeholder, text: $text)
                .padding(.trailing)
                .foregroundColor(Color("secondaryBlue"))
        }
        .padding()
        .overlay(
             RoundedRectangle(cornerRadius: 10)
                .stroke(Color("secondaryBlue").opacity(0.05), lineWidth: 1)
         )
        .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
        .background(Color("secondaryBlue").opacity(0.01))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text:.constant("") , placeholder: "find a store here")
    }
}

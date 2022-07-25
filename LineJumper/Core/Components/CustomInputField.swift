//
//  CustomInputField.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct CustomInputField: View {
    
    let image: String
    let placeholder: String
    var isSecure: Bool? = false
    @Binding var text: String

    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
        
                if isSecure ?? false {
                    SecureField(placeholder, text: $text).foregroundColor(
                        Color(.darkGray))
                    
                } else {
                    TextField(placeholder, text: $text).foregroundColor(
                        Color(.darkGray))
                }
        
            }.font(.subheadline)
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 100).stroke(.black.opacity(0.9)))
        }
        
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(image: "envelope",
                         placeholder: "enter email",
                         isSecure: false,
                         text: .constant(""))
    }
}

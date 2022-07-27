//
//  ManageButton.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct ManageButton: View {
    let theText: String
    let theColor: String
    
    var body: some View {
        
        ZStack{
         
            Capsule()
                .frame(height:40)
                .foregroundColor(Color(theColor))
                .cornerRadius(100)
                .shadow(color: Color(theColor), radius: 2, x: -2, y: 2)
            
            Text(theText)
                .foregroundColor(( theColor == "primary" ? .white : Color("primary")) )
                
        }
    }
}

struct ManageButton_Previews: PreviewProvider {
    static var previews: some View {
        ManageButton(theText: "In line", theColor: "primary" )
    }
}

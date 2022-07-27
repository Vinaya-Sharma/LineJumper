//
//  EmployeeBubble.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct employeeBubble: View {
    var body: some View {
        VStack{
            Image("profilePic")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color("primaryBlue") , lineWidth: 2))
       
        }
    }
}

struct employeeBubble_Previews: PreviewProvider {
    static var previews: some View {
        employeeBubble()
    }
}

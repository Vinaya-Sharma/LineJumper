//
//  UploaderSquare.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct UploaderSquare: View {
    let width: CGFloat;
    let height: CGFloat;
    let roundness: CGFloat;
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width, height: height)
                .foregroundColor(Color("primary").opacity(0.15))
                .overlay(
                     RoundedRectangle(cornerRadius: roundness )
                        .stroke(Color("primary"), lineWidth: 1)
                 )

                Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color("primary"))
                .clipShape(Capsule())
        }
    }
}

struct UploaderSquare_Previews: PreviewProvider {
    static var previews: some View {
        UploaderSquare(width: CGFloat(200), height: CGFloat(100), roundness: CGFloat(20))
    }
}

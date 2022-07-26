//
//  DissmissArrow.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct DissmissArrow: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Image(systemName: "arrow.left")
            .padding()
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: -2, y: 2)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct DissmissArrow_Preview: PreviewProvider {
    static var previews: some View {
        DissmissArrow()
    }
}


//
//  Profile.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            DissmissArrow()
            Text("profile page")
        }.navigationBarTitle("You can't see me 👀")
            .navigationBarHidden(true)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

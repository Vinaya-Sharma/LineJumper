//
//  SideMenuRowView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

import SwiftUI

struct SideMenuRowView: View {
    let item: SideMenuViewModel
    var body: some View {
        HStack{
            Image(systemName: item.imgName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(item.description)
                .font(.subheadline)
            Spacer()
        }.frame(height:40).padding(.horizontal).padding(.vertical, 4)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(item: .profile)
    }
}

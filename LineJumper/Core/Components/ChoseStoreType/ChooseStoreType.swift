//
//  ChooseStoreType.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI

struct ChooseStoreType: View {
    
     @State private var isSelected: StoreTypes = .salon
    
    var body: some View {
            ScrollView(.horizontal){
                HStack{
                    ForEach(StoreTypes.allCases, id:\.name){
                        item in
                  
                        VStack(alignment: .center , spacing: 8){
                            Text(item.icon)
                                .font(.title2)
                                .padding(12)
                                .background(.white)
                                .clipShape(Capsule())
                            
                            Text(item.name)
                                .font(.caption)
                                .frame(width: 100)
                                .foregroundColor(item==isSelected ? .white: .black)
                                    .multilineTextAlignment(.center)
                        }.frame(width: 120, height:105)
                            .background(item==isSelected ? Color("primary"): .white)
                            .cornerRadius(100)
                            .overlay(
                                  RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color("secondaryBlue").opacity(0.05), lineWidth: 2)
                              )
                            .onTapGesture {
                                isSelected = item
                            }
                }
            }.padding(.horizontal)
        }
    }
}

struct ChooseStoreType_Previews: PreviewProvider {
    static var previews: some View {
        ChooseStoreType()
    }
}

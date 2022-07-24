//
//  Homepage.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import SwiftUI

struct Homepage: View {
    @State var findStore: String = ""

    var body: some View {
        VStack{
            
            Header
            
            ChooseStoreType()
                .padding(.vertical)
            
            //pick a store heading
            VStack{
                VStack{
                    HStack{
                        Text("Pick a store")
                            .font(.title2).bold()
                        
                    Spacer()
                        
                        Text("View All")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .underline()
                        
                    }.padding()
                }
            
                
            }
            
            Spacer()
        }
    }
}

extension Homepage{
    var Header: some View{
        VStack(alignment: .leading){
            Text("Where are you visiting?")
                .font(.title).fontWeight(.semibold)
                .padding(.leading)

            
            HStack{
                SearchBar(text: $findStore, placeholder: "Find a store here")
                    .padding(.horizontal)
                
                Image("icon1")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(.white)
                    .overlay(
                         RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("secondaryBlue").opacity(0.05), lineWidth: 1)
                     )
            
                Spacer()
            }
        }.padding(.top, 40)
    }
    
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

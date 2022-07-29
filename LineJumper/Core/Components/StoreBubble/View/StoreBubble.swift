//
//  StoreBubble.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI
import Kingfisher

struct StoreBubble: View {
    
    let company: CompanyModel
    
    var body: some View {
        if company.companyName != nil {
        VStack(alignment:.leading){
            if company.picture != nil {
                KFImage(URL(string: company.picture!))
                    .resizable()
                    .frame(width: 280, height: 180)
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
            }
            
            VStack(alignment:.leading, spacing: 4){
                Text("hiii").foregroundColor(.clear);

                
                Text(company.companyName!)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                HStack{
                    Text("salon")
                        .font(.footnote)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Color("primary"))
                        .foregroundColor(.white)
                        .cornerRadius(100)
                    
                    Spacer()
                    
                    Text(company.address!)
                        .font(.footnote)
                }.foregroundColor(Color("primary"))
                 
            }
            .padding(10)
            .frame(width: 280, height: 50)
                .background(.white)
                .offset(y:-40)
            
            
        }.frame(width: 280)
            .overlay(
                  RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("secondaryBlue").opacity(0.1), lineWidth: 2)
            )
            .padding(.horizontal)
        }
}
}


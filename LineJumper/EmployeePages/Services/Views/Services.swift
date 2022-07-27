//
//  Services.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct Services: View {
    var body: some View {
        VStack(alignment:.leading){
            
            Text("Services")
                .font(.title2)
                .bold()
                .foregroundColor(Color("primaryBlue"))
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:20) {
                    UploaderSquare(width: 180, height: 250, roundness: 20).shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                    
                    ForEach(0 ..< 5, id: \.self){
                        _ in
                        ZStack{
                        VStack(alignment: .leading ){
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 180, height: 160)
                                    .foregroundColor(Color("primary")).opacity(0.4)
                                Text("✂️")
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(100)
                            }
                            
                            VStack(alignment:.leading){
                                Text("Hair Cut")
                                    .font(.title3)
                                    .bold()
                                Text("Est time: 20mins")
                                
                            }.frame(height: 80)
                                .padding(.horizontal)
                            
                                
                        }
                            RoundedRectangle(cornerRadius: 20)       .stroke(Color("primary"))
                                .shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                        }.frame(width: 180, height: 250)
                    }
                    
                }.padding()
                
                   
            }
                
            Text("Working Employees")
                .font(.title2)
                .bold()
                .foregroundColor(Color("primaryBlue"))
                .padding(.top)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                VStack{
                    HStack(spacing:10){
                        ForEach(0 ..< 7, id: \.self){
                            _ in
                            employeeBubble()
                                .shadow(color: Color("primaryBlue"), radius: 2, x: 0, y: 0)
                                .padding(.vertical, 10)

                        }
                        
                    }
                    HStack(spacing:10){
                        ForEach(0 ..< 7, id: \.self){
                            _ in
                            employeeBubble()
                                .shadow(color: Color("primaryBlue"), radius: 2, x: 0, y: 0)
                                .padding(.vertical, 10)

                        }
                        
                    }
                }.padding(.horizontal, 4)
            }
            .padding(.horizontal)
            
            
            Spacer()
        }
    }
}

struct Services_Previews: PreviewProvider {
    static var previews: some View {
        Services()
    }
}

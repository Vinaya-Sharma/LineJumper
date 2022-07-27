//
//  BusinessInformation.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct BusinessInformation: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var companyColor1 =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2);
    @State private var companyColor2 =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2);
    @State private var companyColor3 =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2);
    @State private var description: String = "type here"

    var body: some View {
        
        VStack(alignment:.leading){
            ScrollView{
                if let currentCompany = viewModel.currentCompany {
                VStack(alignment:.leading){
                    
                    Text("Business Information for \(currentCompany.email)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("primaryBlue"))
                        .padding(.top)
                    
                    //image uploader
                    UploaderSquare(width: 300, height: 250, roundness: 20)
                        .shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                        .padding()
                    Text("Business Image")
                        .foregroundColor(Color("primaryBlue"))
                        .font(.subheadline).bold()
                    
                    //company colors
                    HStack(alignment:.center){
                        Text("Company Colours")
                            .foregroundColor(Color("primaryBlue"))
                            .font(.subheadline).bold()
                            .frame(width: 127)
                
                        ColorPicker("", selection: $companyColor1)
                        ColorPicker("", selection: $companyColor2)
                        ColorPicker("", selection: $companyColor3)
                    }.padding(.trailing, 50)
                    
                    //logo and description
                    HStack{
                        //logo uploader
                        VStack{
                            UploaderSquare(width: 100, height: 100, roundness: 20)
                                .shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                                .padding()
                            Text("Business Image")
                                .foregroundColor(Color("primaryBlue"))
                                .font(.subheadline).bold()
                        }
                        
                        //description
                        VStack{
                            ZStack{
                            TextEditor(text: $description)
                                .padding()
                                .frame(width: 150, height: 100)
               
                                RoundedRectangle(cornerRadius: 20).stroke(Color("primary"))
                                .padding()
                                .shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                                
                            }
                            Text("Business Description")
                                .foregroundColor(Color("primaryBlue"))
                                .font(.subheadline).bold()
                        }
                    }
                    
                    Text("Your Managers")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("primaryBlue"))
                        .padding(.top)
                    ScrollView(.horizontal){
                        HStack(spacing:15){
                            UploaderSquare(width: 80, height: 80, roundness: 100)
                                .clipShape(Capsule())
                                .shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                                        
                            ForEach(0 ..< 7, id: \.self){
                                _ in
                                employeeBubble()
                                    .shadow(color: Color("primaryBlue"), radius: 2, x: 0, y: 0)
                                    .padding(.vertical)
                            }
                            
                        }.padding(.horizontal)
                    }.padding(.trailing, 35)
                    
                    Spacer()
                }.padding(.horizontal)
                }}
            }
            
    }
}

struct BusinessInformation_Previews: PreviewProvider {
    static var previews: some View {
        BusinessInformation()
    }
}

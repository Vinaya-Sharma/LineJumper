//
//  ManageCalls.swift
//  LineJumper
//
//  Created by CoopStudent on 7/28/22.
//
import SwiftUI
import FirebaseFirestore

struct ManageCalls: View {
    
    @State private var inLine: Bool = false

    var body: some View {
        VStack(alignment:.leading){
            Text("Manage Customers")
                .font(.title2)
                .bold()
                .foregroundColor(Color("primaryBlue"))
                .padding(.top, 30)
            
            // manage buttons
            HStack{
                ManageButton(theText: "Requested Calls", theColor: inLine ? "primary" : ".white" ).onTapGesture {
                inLine = true
                }
                ManageButton(theText: "Currently On Call", theColor: !inLine ? "primary" : ".white").onTapGesture {
                    inLine = false
                }
            }.padding(.horizontal)
                .padding(.vertical, 8)
                .overlay(Capsule().stroke(Color("primary")) )
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .frame(height: 480)
                
                VStack(alignment:.leading){
                    Group{
                        Text("Currently ")
                        + Text(!inLine ? "Serving" : "In Line").bold().foregroundColor(Color("primary"))
                    }.font(.title3).padding(.vertical, 1)
                    
                    //Headers
                    HStack{
                        Text("Customer")
                        Spacer()
                        Text("Time Remaining")
                        Spacer()
                        Text("Actions")
                        Spacer()
                    }.font(.subheadline)

                Divider()
                
                ScrollView(showsIndicators: false){
                VStack(alignment:.leading){
                                
                   
                    if inLine{
                        VStack(alignment: .leading) {
                        HStack{
                            Image("girl")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(100)
                            
                            Spacer()
                            
                            Text("1 minute")
                            
                            Spacer()
                            
                            //action icons
             
                            HStack{
                                Image(systemName: "x.circle")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                Image(systemName: "bell")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                Image(systemName: "plus")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                Image(systemName: "checkmark")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                            }
                
                            }
                            Text("Vinaya Sharma" ).font(.subheadline).bold()
                            Text("647-879-2615").font(.subheadline).foregroundColor(Color("primary"))
                            
                            HStack{
                                Image("boy")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(100)
                                
                                Spacer()
                                
                                Text("16 minutes")
                                
                                Spacer()
                                
                                //action icons
                 
                                HStack{
                                    Image(systemName: "x.circle")
                                        .padding(4).background(Color("primary"))
                                        .foregroundColor(.white)
                                        .cornerRadius(100)
                                    Image(systemName: "bell")
                                        .padding(4).background(Color("primary"))
                                        .foregroundColor(.white)
                                        .cornerRadius(100)
                                    Image(systemName: "plus")
                                        .padding(4).background(Color("primary"))
                                        .foregroundColor(.white)
                                        .cornerRadius(100)
                                    Image(systemName: "checkmark")
                                        .padding(4).background(Color("primary"))
                                        .foregroundColor(.white)
                                        .cornerRadius(100)
                                }
                    
                                }
                                Text("Krish Sharma" ).font(.subheadline).bold()
                                Text("647-853-1010").font(.subheadline).foregroundColor(Color("primary"))
                        }
                    } else {
                        HStack{
                            Image("girl")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(100)
                            
                            Spacer()
                            
                            Text("< 1 minute")
                            
                            Spacer()
                            
                            //action icons
             
                            HStack{
                                Image(systemName: "x.circle")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                Image(systemName: "bell")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                Image(systemName: "plus")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                Image(systemName: "checkmark")
                                    .padding(4).background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                            }
                
                            }
                            Text("Vinaya Sharma" ).font(.subheadline).bold()
                            Text("647-879-2615").font(.subheadline).foregroundColor(Color("primary"))
                    }
                    
                    Spacer()
                    
                        }
                }.frame(height: 380)
                       
                } .padding(.horizontal)
            }.padding()
            
            
            Spacer()
        }.padding()
        }
    }
    

struct ManageCalls_Previews: PreviewProvider {
    static var previews: some View {
        ManageCalls()
    }
}


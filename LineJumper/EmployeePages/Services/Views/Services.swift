//
//  Services.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI
import FirebaseFirestore

struct Services: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showPopup: Bool = false
    @State private var name: String = ""
    @State private var emoji: String = ""
    @State private var time: String = ""
    
    var body: some View {
        
        if let currentCompany = viewModel.currentCompany{
            
        ZStack{
            VStack(alignment:.leading){
                
                Text("Services")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("primaryBlue"))
                    .padding(.horizontal)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:20) {
                        Button{
                            showPopup = true
                        } label: {
                            UploaderSquare(width: 180, height: 250, roundness: 20).shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                        }
                        
                        if currentCompany.services?.count != nil {
                        ForEach(0 ..< currentCompany.services!.count , id: \.self){
                            service in
                            ZStack{
                            VStack(alignment: .leading ){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 180, height: 160)
                                        .foregroundColor(Color("primary")).opacity(0.4)
                                    Text(currentCompany.services![service].emoji!)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(100)
                                }
                                
                                VStack(alignment:.leading){
                                    Text(currentCompany.services![service].name!)
                                        .font(.title3)
                                        .bold()
                                    Text("Est time: \(currentCompany.services![service].time!)")
                                    
                                }.frame(height: 80)
                                    .padding(.horizontal)
                                
                                    
                            }
                                RoundedRectangle(cornerRadius: 20)       .stroke(Color("primary"))
                                    .shadow(color: Color("primary"), radius: 2, x: 0, y: 0)
                            }.frame(width: 180, height: 250)
                        }
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
            
            //changing background
            if showPopup{
                          ZStack{
                              Color(.black)
                                  .opacity(0.2)
                          }.onTapGesture {
                              withAnimation(.easeInOut)
                              {
                                  showPopup = false
                              }
                          }.ignoresSafeArea()
                      }
            
            //the popup
            if showPopup{
                VStack{
                    Text("Add A Service")
                        .font(.title).bold()
                        .foregroundColor(Color("primary"))
                    
                    CustomInputField(image: "plus.square.on.square", placeholder: "Service Name", text: $name)
                    
                    CustomInputField(image: "face.smiling", placeholder: "Service Emoji", text: $emoji)
                    
                    
                    CustomInputField(image: "clock", placeholder: "Est time spent per customer (mins)", text: $time)
                        .padding(.vertical, 8)
                    
          
                    
                    Divider()
                    
                    if let currentUser = viewModel.currentCompany{
                        Button{
                            Firestore.firestore().collection("companies")
                                .document(currentUser.id!)
                                .updateData([
                                    "services" :
                                        FieldValue.arrayUnion(
                                           [["name" : name, "emoji" : emoji, "time" : time ]]
                                        )
                                ])
                            viewModel.fetchCompany()
                            showPopup = false
                        } label: {
                            Text("Add Service")
                        }
                    }
                    
                }   .padding()
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.horizontal)

            }
            
        }.navigationBarTitle("You can't see me 👀")
        .navigationBarHidden(true)
        
        }
    }
        
}


struct Services_Previews: PreviewProvider {
    static var previews: some View {
        Services()
    }
}

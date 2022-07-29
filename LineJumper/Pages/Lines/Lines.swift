//
//  Lines.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI
import FirebaseFirestore
import Kingfisher

struct Lines: View {
    @State private var inLine: Bool = true
    @EnvironmentObject var viewModel: AuthViewModel
    @State var myLinesList: [myLines] = []
    
    var body: some View {
        VStack(alignment:.leading){
            
            //top header + in line / call requests toggle
            ZStack{
                VStack(alignment:.leading){
                    Text("Your").bold()
                        .font(.largeTitle)
                    Text("Lines").bold().foregroundColor(Color("primary"))
                        .font(.largeTitle)
                    
                    HStack{
                        ManageButton(theText: "In Line", theColor: inLine ? "primary" : ".white" ).onTapGesture {
                        inLine = true
                        }
                        ManageButton(theText: "Call Requests", theColor: !inLine ? "primary" : ".white").onTapGesture {
                            inLine = false
                        }
                    }
                        .overlay(Capsule().stroke(Color("primary")) )
                    
            }.padding()
                
                Image("bunny_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .offset(x:60, y:-65)

            }.frame(height: 200)
                .padding(.top, 44)

            if inLine {
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0 ..< myLinesList.count, id:\.self ) {
                    lineNumber in
            VStack(alignment:.leading){
                KFImage(URL(string: myLinesList[lineNumber].picture ) )
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 320, height: 180)
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
                
                VStack(alignment:.leading, spacing: 4){
                    Text("hiii").foregroundColor(.clear);

                    HStack{
                        
                        Text( myLinesList[lineNumber].companyName )
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                      
                        if viewModel.currentUser?.email == "vinaya@gmail.com"{
                            Text("1 minute remaining")
                                .foregroundColor(Color("primary"))
                        } else if myLinesList[lineNumber].companyName  == "Fine Looks" {
                            Text("1hr 6mins remaining")
                                .foregroundColor(Color("primary"))
                        } else {
                            Text("12 min")
                                .foregroundColor(Color("primary"))
                        }
                    }
                    
                    HStack{
                        HStack{
                            Image(systemName: "plus.circle")
                            Text("Request Time")
                        } .padding(4)
                            .foregroundColor(.white)
                            .background(Color("primary"))
                            .cornerRadius(100)
                        
             
                        
                        HStack{
                            Image(systemName: "x.circle")
                            Text("Leave Line")
                        } .padding(4)
                            .foregroundColor(.white)
                            .background(Color("primary"))
                            .cornerRadius(100)
                    }.font(.footnote).padding(.top, 4)
                     
                }
                .padding(10)
                .frame(width: 320, height: 50)
                    .background(.white)
                    .offset(y:-40)
                
                
            }.frame(width: 320)
                .overlay(
                      RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("secondaryBlue").opacity(0.1), lineWidth: 2)
                )
                .padding(.horizontal)
                .padding(.vertical, 6)
            
            Spacer()
            }
            
            }
            } else {
                VStack(alignment:.leading){
                    Image("salon_2")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill)
                        .frame(width: 320, height: 180)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.2), radius: 3, x: -3, y: 2)
                    
                    VStack(alignment:.leading, spacing: 4){
                        Text("hiii").foregroundColor(.clear);

                        HStack{
                            
                            Text("Company Name")
                                .bold()
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            
                            Text("10 mins remaining")
                                .foregroundColor(Color("primary"))
                        }
                        
                        HStack{
                            HStack{
                                Image(systemName: "plus.circle")
                                Text("Request Time")
                            } .padding(4)
                                .foregroundColor(.white)
                                .background(Color("primary"))
                                .cornerRadius(100)
                            
                 
                            
                            HStack{
                                Image(systemName: "x.circle")
                                Text("Leave Line")
                            } .padding(4)
                                .foregroundColor(.white)
                                .background(Color("primary"))
                                .cornerRadius(100)
                        }.font(.footnote).padding(.top, 4)
                         
                    }
                    .padding(10)
                    .frame(width: 320, height: 50)
                        .background(.white)
                        .offset(y:-40)
                    
                    
                }.frame(width: 320)
                    .overlay(
                          RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("secondaryBlue").opacity(0.1), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                
                Spacer()
            }
        }.onAppear {
            findMyLines()
        }
    }
    
    func findMyLines() {
        
        viewModel.fetchUser()
        
        if viewModel.currentUser?.lines != nil {
            //this function will run for each line the user is a part of
        for theLine in viewModel.currentUser!.lines!{
            //get all of the lines that this user is a part of sorted by created at
            Firestore.firestore().collection("lines")
                .document(theLine)
                .addSnapshotListener { DocumentSnapshot
                    , _ in
                    guard let theLines =  try? DocumentSnapshot?.data(as: currentLineModel.self) else { print("could not read data as line model"); return }
                    
                    // for each line we want to append an object to an array
                    for lline in theLines.currentLine{
              
                        if lline.user == viewModel.currentUser?.id{
                            print("found match")
                            let oneLine = myLines(picture: lline.picture, companyName: lline.companyName, timeRemaining: "10", companyId: theLine)
                            print(oneLine)
                            
                            if myLinesList.contains(where: {$0.self == oneLine }){
                                print("already here")
                            } else {
                                myLinesList.append(oneLine)
                            }
                            
                        }
                        
                    }
                }
            }
  
        } else {
            print("current user is not a part of any lines")
        }
        print(myLinesList)
    }
}




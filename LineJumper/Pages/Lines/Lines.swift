//
//  Lines.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI
import FirebaseFirestore

struct Lines: View {
    @State private var inLine: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var myLinesList: [myLines] = []
    
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

            ScrollView(.vertical, showsIndicators: false){
            ForEach( 0 ..< 5, id:\.self ){
                _ in
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
                        
                        Text("Company name")
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        
                        Text("10 mins remainging")
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
            
            }
        }.onAppear {
            findMyLines()
        }
    }
    
    func findMyLines() {
        
        viewModel.fetchUser()
        
        if viewModel.currentUser?.lines! != nil {
            //this function will run for each line the user is a part of
        for theLine in viewModel.currentUser!.lines!{
            //get all of the lines that this user is a part of sorted by created at
            Firestore.firestore().collection("lines")
                .document(theLine)
                .addSnapshotListener { DocumentSnapshot
                    , _ in
                    guard let theLines =  try? DocumentSnapshot?.data(as: currentLineModel.self) else {return }
                    
                    // for each line we want to append an object to an array
                    for lline in theLines.currentLine{
              
                        if lline.user == viewModel.currentUser?.id{
                            let oneLine = myLines(picture: lline.picture, companyName: lline.companyName, timeRemaining: "10", companyId: theLine)
                            
                            myLinesList.append(oneLine)
                            
                        }
                        
                    }
                }
            }
            print(myLinesList)
        }
    }
}


struct Lines_Previews: PreviewProvider {
    static var previews: some View {
        Lines()
    }
}
//
//    .addSnapshotListener { snapshot, err in
//        if err != nil {
//            print("DEBUG - error occured while fetching users lines")
//            return
//        } else {
//            print(snapshot)
//        }
//    }

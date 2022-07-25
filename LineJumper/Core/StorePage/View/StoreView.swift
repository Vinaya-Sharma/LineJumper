//
//  StoreView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI

struct StoreView: View {
    @State private var showPopup: Bool = true
    @State private var selectedPopup: Int = 1
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        
        ZStack{
            ScrollView{
                VStack(alignment:.leading){
                    // top image
                    TopImg()
            
                    StoreContent()
                    
                    Buttons
                    
                    Spacer()
                }.padding(.vertical, 40)

            }.navigationBarTitle("You can't see me 👀")
            .navigationBarHidden(true)
            
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
            
            if showPopup{
                VStack{
                    Text("Your Information")
                        .font(.title).bold()
                        .foregroundColor(Color("primary"))
                    
                    CustomInputField(image: "envelope", placeholder: "Name", text: $name)
                    
                    CustomInputField(image: "envelope", placeholder: "Phone number", text: $phoneNumber)
                        .padding(.vertical, 8)
                    
                    HStack{
                        Text("Estimated Wait time")
                            .font(.subheadline)
                        
                        Spacer()
                        Text("15 mins").font(.subheadline).bold()
                    }.padding(.top)
                    
                    Divider()
                    
                    if(selectedPopup == 1){
                        Button{
                            print("stand the user in line")
                        } label: {
                            Text("Stand in line")
                        }
                    } else {
                        Button{
                            print("now in phone call line")
                        } label: {
                            Text("Book a call")
                        }
                    }
                    
                }   .padding()
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.horizontal)

            }
            
        }.ignoresSafeArea()
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}

struct ServiceBubble: View {
    var body: some View {
        VStack(alignment:.center, spacing:6){
            Text("💇‍♂️").font(.title)
            Text("Hair Cut").font(.subheadline)
        }.padding(5)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: -1, y: 1)
            .padding(.horizontal, 4)
    }
}

struct TopImg: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .top){
            Image("salon_4")
                .resizable()
                .frame(width:350, height: 250)
                .cornerRadius(25)
            
            HStack(alignment: .top){
                Image(systemName: "arrow.left")
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: -2, y: 2)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                
                Spacer()
                
                Image(systemName: "heart.fill")
                    .padding()
                    .background(Color("primary"))
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .shadow(color: .gray, radius: 2, x: -2, y: 2)
            }.padding(.horizontal, 25)
                .padding(.vertical)
            
        }
    }
}

struct StoreContent: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Ninas Parlor")
                .font(.title).bold()
            
            Text("A little description wjeng jrengjern rejngjr rekngrejg grejng gerjngr grjngr rkgjrneg gnrjgn rengjrn grngjrng rngjkr rjngrjng jenjen jgnrj rjgnrj rgnjrng rngjrngj rjgnjrn")
                .lineSpacing(4)
                .font(.subheadline)
                .foregroundColor(.black)
                .opacity(0.7)
                .padding(.vertical, 1)
                .lineSpacing(5)
            
            Text("Select A Service")
                .font(.title3)
                .bold()
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false ){
                HStack{
                    ForEach(0 ..< 7, id: \.self){
                        _ in ServiceBubble()
                    }
                }.padding(.vertical)
            }
            
            Text("Select A Location")
                .font(.title3)
                .bold()
            
            
            ScrollView(.horizontal, showsIndicators: false ){
                HStack{
                    ForEach(0 ..< 5, id: \.self){
                        _ in
                        ZStack(alignment: .bottomLeading){
                            Image("salon_2")
                                .resizable()
                                .frame(width: 220, height: 150)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: -1, y: 2)
                            
                            Text("339 Mclaughclin Rd.")
                                .font(.subheadline)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(6)
                            
                        }.padding(.horizontal, 6)
                    }
                }
            }
            
            
        }.padding()
    }
}

extension StoreView{
    var Buttons: some View {
        HStack(spacing:4){
            Button {
                selectedPopup = 1
                showPopup.toggle()
             
                
            } label: {
                HStack{
                    Image(systemName: "person.3.sequence.fill")
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("primary"))
                        .background(.white)
                        .cornerRadius(100)
                    
                    Text("Stand In Line")
                        .foregroundColor(.white)
                }.padding(4)                            .padding(.trailing)
                    .background(Color("primary"))
                    .cornerRadius(100)
                    .shadow(color: Color("primary").opacity(0.5), radius: 1, x: -1, y: 1)
            }
            
            Button {
                selectedPopup = 2
                showPopup.toggle()
            } label: {
                HStack{
                    Image(systemName: "phone.fill")
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("primary"))
                        .background(.white)
                        .cornerRadius(100)
                    
                    Text("Call here")
                        .foregroundColor(.white)
                }.padding(4)
                    .padding(.trailing)
                    .background(Color("primary"))
                    .cornerRadius(100)
                    .shadow(color: Color("primary").opacity(0.5), radius: 1, x: -1, y: 1)
            }
            
        }.padding(.horizontal)
    }
    
}

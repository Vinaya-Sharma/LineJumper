//
//  StoreView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI
import Kingfisher
import FirebaseFirestore

struct StoreView: View {
    let theCompany: CompanyModel
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showPopup: Bool = false
    @State private var selectedPopup: Int = 1
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State var selectedServices: [servicesModel] = []
    
    var body: some View {
        
        ZStack{
            ScrollView{
                VStack(alignment:.leading){
                    // top image
                    TopImg(theCompany: theCompany)
            
                    VStack(alignment:.leading){
                        Text(theCompany.companyName!)
                            .font(.title).bold()
                        
                        Text(theCompany.description!)
                            .lineSpacing(4)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .opacity(0.7)
                            .padding(.vertical, 1)
                            .lineSpacing(5)
                        
                        Text("Select Services")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false ){
                            HStack{
                                if theCompany.services?.count != nil {
                                ForEach(0 ..< theCompany.services!.count, id: \.self){
                                    
                                    service in
                                    
                                    Button{
                                        if selectedServices.contains(where: {$0.name == theCompany.services![service].name }){
                                            selectedServices.remove(at: selectedServices.firstIndex(of: theCompany.services![service])!)
                                        } else {
                                            selectedServices.append(theCompany.services![service])
                                        }
                                    } label: {
                                        
                                        if selectedServices.contains(where: {$0.name == theCompany.services![service].name }){
                                            ServiceBubble( service: theCompany.services![service], selected: true )
                                        } else {
                                            ServiceBubble( service: theCompany.services![service], selected: false )
                                        }
                                        
                                    }
                                    
                            }.padding(.vertical)
                                }
                                }
                        
            //            Text("Select A Location")
            //                .font(.title3)
            //                .bold()
            //
            //
            //            ScrollView(.horizontal, showsIndicators: false ){
            //                HStack{
            //                    ForEach(0 ..< 5, id: \.self){
            //                        _ in
            //                        ZStack(alignment: .bottomLeading){
            //                            Image("salon_2")
            //                                .resizable()
            //                                .frame(width: 220, height: 150)
            //                                .cornerRadius(10)
            //                                .shadow(color: .gray, radius: 2, x: -1, y: 2)
            //
            //                            Text("339 Mclaughclin Rd.")
            //                                .font(.subheadline)
            //                                .padding(7)
            //                                .background(.white)
            //                                .cornerRadius(10)
            //                                .padding(6)
            //
            //                        }.padding(.horizontal, 6)
            //                    }
            //                }
             }
                        
                        
                    }.padding()
                    
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
                            
                            var ser: [String] = []
                            for service in selectedServices {
                                ser.append( service.name! )
                            }
                            
                            Firestore.firestore().collection("customers")
                                .document(viewModel.currentUser!.id!)
                                .updateData(["lines" : FieldValue.arrayUnion([theCompany.id!]) ])
            
                            let data : [String : Any] = [
                                                "user" : String(viewModel.currentUser!.id!),
                                                "name" : name,
                                                "phoneNumber" : phoneNumber,
                                                "services" : ser,
                                                "at" : Timestamp(date: Date()),
                                                "companyName" : theCompany.companyName!,
                                                "picture" : theCompany.picture!,
                                                "userPhoto" : viewModel.currentUser?.photo ?? "false"
                                            ]
                                            
                                            Firestore.firestore().collection("lines")
                                                .document(theCompany.id!)
                                                .updateData(["currentLine" : FieldValue.arrayUnion([data]) ])
                                                
                                            showPopup = false
                            
                        } label: {
                            Text("Stand in line")
                        }
                    } else {
                        Button{
                            print("now in phone call line")
                            showPopup = false
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


struct ServiceBubble: View {
    var service: servicesModel
    var selected: Bool
    var body: some View {
        VStack(alignment:.center, spacing:6){
            Text(service.emoji!).font(.title)
            Text(service.name!).font(.subheadline)
        }.padding(5)
            .foregroundColor(selected ? .white : Color("primary"))
            .background(selected ? Color("primary") : .white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: -1, y: 1)
            .padding(.horizontal, 4)
    }
}

struct TopImg: View {
    let theCompany: CompanyModel
    
    var body: some View {
        ZStack(alignment: .top){
            KFImage(URL(string: theCompany.picture!))
                .resizable()
                .frame(width:350, height: 250)
                .cornerRadius(25)
            
            HStack(alignment: .top){
                DissmissArrow()
            
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
    let theCompany: CompanyModel
    @State var selectedServices: [servicesModel]
    
    var body: some View {
        VStack(alignment:.leading){
            Text(theCompany.companyName!)
                .font(.title).bold()
            
            Text(theCompany.description!)
                .lineSpacing(4)
                .font(.subheadline)
                .foregroundColor(.black)
                .opacity(0.7)
                .padding(.vertical, 1)
                .lineSpacing(5)
            
            Text("Select Services")
                .font(.title3)
                .bold()
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false ){
                HStack{
                    ForEach(0 ..< theCompany.services!.count, id: \.self){
                        
                        service in
                        
                        Button{
                            if selectedServices.contains(where: {$0.name == theCompany.services![service].name }){
                                selectedServices.remove(at: selectedServices.firstIndex(of: theCompany.services![service])!)
                            } else {
                                selectedServices.append(theCompany.services![service])
                            }
                        } label: {
                            
                            if selectedServices.contains(where: {$0.name == theCompany.services![service].name }){
                                ServiceBubble( service: theCompany.services![service], selected: true )
                            } else {
                                ServiceBubble( service: theCompany.services![service], selected: false )
                            }
                            
                        }
                        
                }.padding(.vertical)
            }
            
//            Text("Select A Location")
//                .font(.title3)
//                .bold()
//
//
//            ScrollView(.horizontal, showsIndicators: false ){
//                HStack{
//                    ForEach(0 ..< 5, id: \.self){
//                        _ in
//                        ZStack(alignment: .bottomLeading){
//                            Image("salon_2")
//                                .resizable()
//                                .frame(width: 220, height: 150)
//                                .cornerRadius(10)
//                                .shadow(color: .gray, radius: 2, x: -1, y: 2)
//
//                            Text("339 Mclaughclin Rd.")
//                                .font(.subheadline)
//                                .padding(7)
//                                .background(.white)
//                                .cornerRadius(10)
//                                .padding(6)
//
//                        }.padding(.horizontal, 6)
//                    }
//                }
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


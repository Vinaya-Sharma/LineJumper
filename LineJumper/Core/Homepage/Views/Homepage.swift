//
//  Homepage.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Homepage: View {
    @State var findStore: String = ""
    @State var theCompanies: [CompanyModel] = []

    var body: some View {
            ScrollView(){
                VStack{
                    
                    Header
                    
                    ChooseStoreType()
                        .padding()
                    
                    StoresView
                    
                    Spacer()
                }
            }.onAppear{
                fetchCompanies()
            }
    }
    
    func fetchCompanies(){
       
        Firestore.firestore().collection("companies").getDocuments(completion: { QuerySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    guard let company = try? document.data(as: CompanyModel.self) else {return}
                    theCompanies.append(company)
                }
            }
        })
        

//
//        Firestore.firestore().collection("customers")
//            .document(uid)
//            .getDocument {snapshot, _ in
//                guard let snapshot = snapshot else {return}
//                guard let user = try? snapshot.data(as: UserModel.self) else {return}
//
//                completion(user)
//            }
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
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: -2, y: 2)
            
                Spacer()
            }
        }.padding(.top, 10)
        
    }
    
    var StoresView: some View{
        VStack{
            //pick a store heading
            VStack(alignment:.leading){
                VStack{
                    HStack{
                        Text("Pick a store")
                            .font(.title2).bold()
                        
                    Spacer()
                        
                        Text("View All")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .underline()
                        
                    }.padding(.horizontal)
                        .padding(.bottom)
                }
            
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0 ..< theCompanies.count , id: \.self){
                                company in
                                
                                NavigationLink {
                                    StoreView(theCompany: theCompanies[company])
                                } label: {
                                    StoreBubble(company: theCompanies[company])
                                }
                            }

                    }
                }
            }
            
            //pick a store heading
            VStack(alignment:.leading){
                VStack{
                    HStack{
                        Text("Popular Stores")
                            .font(.title2).bold()
                        
                    Spacer()
                        
                        Text("View All")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .underline()
                        
                    }.padding()
                }
            
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0 ..< theCompanies.count , id: \.self){
                                company in
                                
                                NavigationLink {
                                    StoreView(theCompany: theCompanies[company])
                                } label: {
                                    StoreBubble(company: theCompanies[company])
                                }
                            }
                    }
                }.statusBar(hidden: true)
            }
        }
    }
    
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

//
//  RegistrationView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var owner = false
    @State private var email = ""
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var isCustomer: Bool = true
    @State private var isOwner: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(){
            
            ZStack{
                AuthHeader(title: "Get Started.", description: "Create Your Account").ignoresSafeArea()
                
                
                Image("bunny_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                    .frame(width: 140)
                    .offset(x: -120, y: 40)
            }

            
            HStack{
                Button{
                    isCustomer = true
                }label: {
                    Text("Customer ")
                        .font(.title2)
                        .bold()
                        .foregroundColor( isCustomer ? Color("primary") : .black )
       
                }
                
                Button{
                    isCustomer = false
                } label: {
                    Text("|  Employee").font(.title2).bold()
                        .foregroundColor( !isCustomer ? Color("primary") : .black )
                }
            }
                        
            VStack(spacing: 20){
                CustomInputField(image: "envelope", placeholder: "Email", text: $email)
                CustomInputField(image: "phone", placeholder: "Phone Number", text: $phoneNumber)
                CustomInputField(image: "person", placeholder: "Full Name", text: $fullName)
                CustomInputField(image: "key", placeholder: "Password", isSecure:true ,text: $password)
                

                if !isCustomer{
                
                    HStack{
                        Text("Are you an owner starting a business with LineJumper?")
                            .frame(width: 220)
                        
                        Spacer()
                        
                        !isOwner ? Image(systemName: "square") : Image(systemName: "checkmark.square")
                        
                    } .onTapGesture {
                        isOwner.toggle()
                        print("isOwner")
                    }
                }
            
            }.padding(.horizontal, 32)
            
            VStack{
                Button{
                    if isCustomer{
                        viewModel.signup(withEmail: email, password: password, fullName: fullName, phoneNumber: phoneNumber, isCustomer: "true", isOwner: "false")
                    } else if isOwner{
                        viewModel.signup(withEmail: email, password: password, fullName: fullName, phoneNumber: phoneNumber, isCustomer: "false", isOwner: "true")
                    } else {
                        viewModel.signup(withEmail: email, password: password, fullName: fullName, phoneNumber: phoneNumber, isCustomer: "false", isOwner: "false")
                    }
       
                }label: {
                    Text("Sign Up")
                        .frame(width: 340, height: 50)
                        .background(Color("primary"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding()
                }.shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote).bold()
                }.padding(.bottom, 32).foregroundColor(.blue)
            }
            
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

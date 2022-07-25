//
//  LoginView.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // parent stack
        VStack{
            
            ZStack{
                AuthHeader(title: "Hey There.", description: "Welcome Back!")
                
                Image("bunny_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                    .frame(width: 140)
                    .offset(x: 120, y: -30)
        
            }
            
            HStack(alignment:.bottom){
               
                    Text("Speedy")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("primary") )
                        +
                    Text(" was missing you").font(.title2).bold()
                        .foregroundColor(.black )
            
            }.padding(.vertical)
                .padding(.top, 32)
           
            VStack(spacing: 20){
                
                CustomInputField(image: "envelope", placeholder: "Email", text: $email)
                CustomInputField(image: "key", placeholder: "Password", isSecure:true ,text: $password)
                
            }.padding(.horizontal, 32)

       
            
            HStack{
                Spacer()
              
                NavigationLink{
                    Text("Reset Password")
                }label: {
                    Text("Forgot Password?")
                        .font(.caption).bold()
                        .foregroundColor(.blue)
                }
                
            }.padding(.trailing, 24)
                .padding(.top)

            VStack{
                Button{
                    viewModel.login(withEmail: email, password: password)
                }label: {
                    Text("Sign In")
                        .frame(width: 340, height: 50)
                        .background(Color("primary"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding()
                }.shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            
            Spacer()
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            }label: {
                HStack{
                    Text("Don't have an account")
                        .font(.footnote)
                    
                    Text("Sign up")
                        .font(.footnote).bold()
                }.padding(.bottom, 60).foregroundColor(.blue)
            }
            
            
        }.ignoresSafeArea()
            .navigationBarHidden(true)
    }}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

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
    @State private var isCustomer: Bool = true
    //@EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // parent stack
        VStack{
                
            AuthHeader(title: "Hey There.", description: "Welcome Back!")
  
            VStack(alignment:.leading, spacing: 20){
                
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
                
                CustomInputField(image: "envelope", placeholder: "Email", text: $email)
                CustomInputField(image: "key", placeholder: "Password", isSecure:true ,text: $password)
                
            }.padding(.horizontal, 32)
                .padding(.top, 44)
            
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
                    //viewModel.login(withEmail: email, password: password)
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
                //RegistrationView()
                 //   .navigationBarHidden(true)
            }label: {
                HStack{
                    Text("Don't have an account")
                        .font(.footnote)
                    
                    Text("Sign up")
                        .font(.footnote).bold()
                }.padding(.bottom, 32).foregroundColor(.blue)
            }
            
            
        }.ignoresSafeArea()
            .navigationBarHidden(true)
    }}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

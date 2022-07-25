//
//  AuthViewModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didRegUser: Bool = false
    @Published var currentUser: User?
    var tempUserSession: FirebaseAuth.User?
    
    init (){
        self.userSession = Auth.auth().currentUser
        signOut()
    }
    
    func login (withEmail email: String, password:String){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if let error = error{
                print("Could not sign in \(error)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
        }
    }
    
    func signup (withEmail email: String, password:String, fullName: String, phoneNumber:String, isCustomer:String, isOwner:String){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            
            if let error = error{
                print("Could not sign up. \(error)")
                return
            }
            
            guard let user =  result?.user else {return}
//            self.tempUserSession = user
            self.userSession = user
            
            let data = [
                "email": email,
                "phoneNumber": phoneNumber,
                "fullName": fullName,
                "password": password,
                "isCustomer": isCustomer,
                "isOwner": isOwner
            ]
            
            Firestore.firestore().collection("customers")
                .document(user.uid)
                .setData(data){
                    _ in
                    self.didRegUser = true
                }
        }
    }
    
     
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
        
    }

}

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
    @Published var currentUser: UserModel?
    var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init (){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
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
            self.fetchUser()
        }
    }
    
    func signup (withEmail email: String, password:String, fullName: String, phoneNumber:String, isCustomer:String, isOwner:String){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            
            if let error = error{
                print("Could not sign up. \(error)")
                return
            }
            
            let data = [
                "email": email,
                "phoneNumber": phoneNumber,
                "fullName": fullName,
                "password": password,
                "isCustomer": isCustomer,
                "isOwner": isOwner
            ]
            
            guard let user =  result?.user else {return}
            Firestore.firestore().collection("customers")
                .document(user.uid)
                .setData(data){
                    _ in
                    self.didRegUser = true
                }

            // self.tempUserSession = user
            self.userSession = user
            self.fetchUser()

            
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
        
    }
    
    func fetchUser(){
          guard let userid = self.userSession?.uid else {return}
          service.fetchUser(withUid: userid) { user in
              self.currentUser = user
          }
    }

}

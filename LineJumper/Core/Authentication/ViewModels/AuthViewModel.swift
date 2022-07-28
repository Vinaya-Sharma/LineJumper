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
    @Published var currentCompany: CompanyModel?
    var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init (){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
        self.fetchCompany()
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
            
            if self.currentUser?.isOwner == "true"{
                self.fetchCompany()
            }
        }
    }
    
    func signup (withEmail email: String, password:String, fullName: String, phoneNumber:String, isCustomer:String, isOwner:String){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            
            if let error = error{
                print("Could not sign up. \(error)")
                return
            }
            
            let data : [String: Any] = [
                "email": email,
                "phoneNumber": phoneNumber,
                "fullName": fullName,
                "password": password,
                "isCustomer": isCustomer,
                "isOwner": isOwner,
                "lines": []
            ]
            
            let code:String = String(Int.random(in: 10000..<100000))
            //business type, address, name
            
            guard let user =  result?.user else {return}
            
            if isOwner == "true"
                {
                    let bData = [
                    "email": email,
                    "phoneNumber": phoneNumber,
                    "fullName": fullName,
                    "employeeCode": code
                ]
                print("yes you are an owner")
                    
                    Firestore.firestore().collection("companies")
                        .document(user.uid)
                        .setData(bData){
                            _ in
                            self.didRegUser = true
                        }
            } else {
                print("no owner :(")
            }
            

            Firestore.firestore().collection("customers")
                .document(user.uid)
                .setData(data){
                    _ in
                    self.didRegUser = true
                }
        
       

            // self.tempUserSession = user
            self.userSession = user
            self.fetchUser()

            if self.currentUser?.isOwner == "true"{
                self.fetchCompany()
            }
            
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
    
    func fetchCompany(){
        guard let userid = self.userSession?.uid else {return}
        service.fetchCompany(withUid: userid){
            user in
            self.currentCompany = user
        }
    }
    
    //this is where error might be happening
    func uploadPhoto(_ image: UIImage, logo: UIImage, Data: [AnyHashable : Any]){
        print("running upload to firebase firestore")
        guard let userId = self.currentUser?.id else {return}
        
        ImageUploader.uploadImg(image: image ){
            profilePicUrl in
            
            Firestore.firestore().collection("companies")
                .document(userId)
                .updateData(["picture": profilePicUrl])
        }
        
        ImageUploader.uploadImg(image: logo){
            profilePicUrl in
            
            Firestore.firestore().collection("companies")
                .document(userId)
                .updateData(["logo": profilePicUrl])
        }
        
        Firestore.firestore().collection("companies")
            .document(userId)
            .updateData(Data)

    }
    
    func updatePhoto(_ image: UIImage){
        print("running upload to firebase firestore")
        guard let userId = self.currentUser?.id else {return}
        
        ImageUploader.uploadImg(image: image ){
            profilePicUrl in
            
            Firestore.firestore().collection("customers")
                .document(userId)
                .updateData(["photo": profilePicUrl])
        }
    }
}


//
//  UserService.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import Foundation
import Firebase

struct UserService{
    
    func fetchUser(withUid uid : String, completion: @escaping(UserModel) -> Void) {
        print("fetching user with uid of \(uid)")
        Firestore.firestore().collection("customers")
            .document(uid)
            .getDocument {snapshot, _ in
                guard let snapshot = snapshot else {return}
                guard let user = try? snapshot.data(as: UserModel.self) else {return}
            
                completion(user)
            }
    }
    
}

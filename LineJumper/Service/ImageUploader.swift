//
//  ImageUploader.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader{
    
    static func uploadImg(image: UIImage, completion: @escaping(String) -> Void){
        
        guard let imageFile = image.jpegData(compressionQuality: 0.5) else {return}
        let fileName = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageFile, metadata: nil){
            _, error in
            
            if let error = error{
                print("Error uploading image to storage \(error)")
                return
            }
        
            ref.downloadURL{
                imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
        
    }
    
}

//
//  UserModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//
import Foundation
import FirebaseFirestoreSwift

struct UserModel: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let fullName: String
    let isCustomer: String
    let isOwner: String
    let phoneNumber: String
    let photo: String?
    let lines: [String]?
}

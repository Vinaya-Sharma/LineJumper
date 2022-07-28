//
//  LineModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/28/22.
//

import Foundation
import FirebaseFirestoreSwift

struct companyLines: Codable{
    @DocumentID var id: String?
    let at: Date;
    let name: String;
    let phoneNumber: String;
    let services: [String];
    let user: String;
    let companyName: String;
    let picture: String;
}

struct myLines: Codable{
    let picture : String,
    let companyName : String,
    let timeRemaining : String,
    let companyId : String
}

struct currentLineModel: Decodable, Identifiable{
    @DocumentID var id: String?
    var currentLine: [companyLines]
}

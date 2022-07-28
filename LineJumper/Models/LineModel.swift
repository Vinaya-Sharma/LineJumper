//
//  LineModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/28/22.
//

import Foundation
import FirebaseFirestoreSwift

struct companyLines: Codable{
    let at: Date;
    let name: String;
    let phoneNumber: String;
    let services: [String];
    let user: String;
    let companyName: String;
    let picture: String;
    let userPhoto: String?
}

struct myLines: Equatable{
    let picture : String;
    let companyName : String;
    let timeRemaining : String;
    let companyId : String;
}

struct currentLineModel: Decodable {
    var currentLine: [companyLines]
}

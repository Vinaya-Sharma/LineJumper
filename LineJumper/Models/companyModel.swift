//
//  companyModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct servicesModel: Codable, Equatable{
    var name: String?
    var emoji: String?
    var time: String?
}

struct CompanyModel: Identifiable, Decodable{
    @DocumentID var id: String?
    let email: String
    let employeeCode: String
    let fullName: String
    let phoneNumber: String
    var picture: String?
    var logo: String?
    var description: String?
    var address: String?
    var companyName: String?
    var type: String?
    var services: [ servicesModel ]?
    //var services: [ [ var name: String; var emoji: String; var time: String; ] ]?
}

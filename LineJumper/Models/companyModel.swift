//
//  companyModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/26/22.
//

import Foundation
import FirebaseFirestoreSwift

struct CompanyModel: Identifiable, Decodable{
    @DocumentID var id: String?
    let email: String
    let employeeCode: String
    let fullName: String
    let phoneNumber: String
}

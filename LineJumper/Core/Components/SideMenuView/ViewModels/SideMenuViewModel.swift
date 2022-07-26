//
//  SideMenuViewModel.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable{
    case profile
    case impact
    case logout
    
    var description: String {
        switch self{
        case .profile:
            return "Profile"
        case .impact:
            return "Impact"
        case .logout:
            return "Logout"
        }
    }
    
    var imgName: String{
        switch self{
        case .profile:
            return "person"
        case .impact:
            return "globe.asia.australia"
        case .logout:
            return "arrow.left.square"
        }
    }
    
}

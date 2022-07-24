//
//  StoreTypes.swift
//  LineJumper
//
//  Created by CoopStudent on 7/23/22.
//

import Foundation

enum StoreTypes: CaseIterable {
    case salon
    case consessionStand
    case doctors
    case theatre
    
    var name: String{
        switch self{
        case .salon:
                return "Salons"
            
        case .consessionStand:
                return "Food bars"
            
                
        case .doctors:
                return "Doctors"
      
                
        case .theatre:
                return "Theatres"
    
        }
    }
    
    var icon: String{
        switch self{
        case .salon:
                return "💇‍♀️"
            
        case .consessionStand:
                return "🍭"
            
                
        case .doctors:
                return "🩺"
            
        case .theatre:
                return "🎥"
    
        }
    }
    
}

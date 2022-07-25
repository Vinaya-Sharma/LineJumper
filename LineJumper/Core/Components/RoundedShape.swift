//
//  RoundedShape.swift
//  LineJumper
//
//  Created by CoopStudent on 7/25/22.
//

import SwiftUI
import Foundation


struct RoundedShape: Shape{
    var corner: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: 80, height: 80))
   
        return Path(path.cgPath)
    }
}

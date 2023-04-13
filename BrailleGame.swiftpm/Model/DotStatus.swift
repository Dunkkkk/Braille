//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

import SwiftUI

enum DotStatus {
    
    case activate
    case nonActivate
    case wrong
    case correct
}

extension DotStatus {
    var color: Color {
        switch self {
        case .activate:
            return Color(hex: "#FAE085")!
        case .nonActivate:
            return Color(hex: "#FEFEFE")!
        case .wrong:
            return Color(hex: "FA8C85")!
        case .correct:
            return .green
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .activate:
            return .clear
        case .nonActivate:
            return Color(hex: "#FAE085")!
        case .wrong:
            return Color(hex: "FA8C85")!
        case .correct:
            return .green
        }
    }
    
    mutating func toggle(){
        if self == .wrong || self == .activate {
            self = .nonActivate
        }
        else {
            self = .activate
        }
    }
}

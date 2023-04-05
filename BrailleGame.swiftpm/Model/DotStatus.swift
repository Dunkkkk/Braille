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
            return .black
        case .nonActivate:
            return .gray
        case .wrong:
            return . red
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
